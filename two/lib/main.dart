
import "dart:io";
import "package:flutter/material.dart";
import "package:path_provider/path_provider.dart";
import "appointments/Appointments.dart";
import "contacts/Contacts.dart";
import "notes/Notes.dart";
import "tasks/Tasks.dart";
import "utils.dart" as utils;

void main(){

  start() async {
      Directory docsDir = await getApplicationDocumentsDirectory();
      utils.docsDir = docsDir;
      runApp(Two());

  }

  start();
}

class Two extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "A bit more complex",
      home: DefaultTabController(
              length: 4,
              child: Scaffold(
                  appBar: AppBar(
                  title: Text("Example 2"),
                  bottom: TabBar(
                    tabs: <Widget>[

                        Tab(icon:Icon(Icons.date_range),           text: 'Appointments'),
                        Tab(icon:Icon(Icons.contacts),             text: 'Contacts'),
                        Tab(icon:Icon(Icons.note),                 text: 'Notes'),
                        Tab(icon:Icon(Icons.assignment_turned_in), text: 'Tasks'),

                    ],
                  ),
                  ),
                  body: TabBarView(
                    children: <Widget>[
                      Appointments(),
                      Contacts(),
                      Notes(),
                      Tasks()
                    ],
                  ),  

              ),
      )
      
    );
  }
}