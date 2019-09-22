import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../user.dart';
import './bloc/bloc.dart';
import '../models/trip_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyTripsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => MyTripsBloc(),
      child: Scaffold(
        body: MyTripList(),
      ),
    );
  }
}

class MyTripList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: TripData.getMyTrips() ,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
         if(snapshot.hasData){
            return  ListView(
              children: snapshot.data.documents.map((document) {
                String tmp = '';
                (document['gps'] as List).forEach((f) => tmp += f['lat'].toString() + ' -- ' + f['lng'].toString() + '\n\n' );
                return  ListTile(
                  leading: Icon(FontAwesomeIcons.fly),
                  title: new Text((document['tid'] as int).toString()),
                  subtitle: new Text(tmp),
                );
              }).toList(),
            );
        } else {
          return Center(child: CircularProgressIndicator(strokeWidth: 3.0,));
        }


      },
    );
  }
}
        