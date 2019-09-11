import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

final party = [
 {"partyname": "BJP", "rating": 1},
 {"partyname": "Congress", "rating": 3},
 {"partyname": "AAP", "rating": 5},
 {"partyname": "Janata Dal Party", "rating": 9},
 {"partyname": "NOTA", "rating": 11},
];

class Record {
 final String name;
 final int votes;
 final DocumentReference reference;

 Record.fromMap(Map<String, dynamic> map, {this.reference})
     : assert(map['partyname'] != null),
       assert(map['partyvotes'] != null),
       name = map['partyname'],
       votes = map['partyvotes'];

 Record.fromSnapshot(DocumentSnapshot snapshot)
     : this.fromMap(snapshot.data, reference: snapshot.reference);

 @override
 String toString() => "Record<$name:$votes>";
}

class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'State Party Elections - Worker Profile',
     home: MyHomePage(),
   );
 }
}

class MyHomePage extends StatefulWidget {
 @override
 _MyHomePageState createState() {
   return _MyHomePageState();
 }
}

class _MyHomePageState extends State<MyHomePage> {
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text('Party Votes')),
     body: _buildBody(context),
   );
 }

 Widget _buildBody(BuildContext context) {
   return StreamBuilder<QuerySnapshot>(
     stream: Firestore.instance.collection('party').snapshots(),
     builder: (context, snapshot) {
       if (!snapshot.hasData) return Text('Please Wait');
      //  if (!snapshot.hasData) return LinearProgressIndicator();

       return _buildList(context, snapshot.data.documents);
     },
   );
 }

 Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
   return ListView(
     padding: const EdgeInsets.only(top: 22.0),
     children: snapshot.map((data) => _buildListItem(context, data)).toList(),
   );
 }

 Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
   final record = Record.fromSnapshot(data);

   return Padding(
     key: ValueKey(record.name),
     padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 
     7.0),
     child: Container(
       decoration: BoxDecoration(
         border: Border.all(color: Colors.red),
         borderRadius: BorderRadius.circular(6.0),
       ),
       child: ListTile(
         title: Text(record.name),
         trailing: Text(record.votes.toString()),
         onTap: () => Firestore.instance.runTransaction((transaction) 
         async {
           final freshFBsnapshot = await 
             transaction.get(record.reference);
            final updated = Record.fromSnapshot(freshFBsnapshot);

               await transaction
                   .update(record.reference, {'partyvotes': 
            updated.votes + 1});
             }),
       ),
     ),
   );
 }
}
