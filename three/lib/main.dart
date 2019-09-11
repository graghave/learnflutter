import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class Widget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(child: Text("i am a raised button"), onPressed: (){}, ),
    );
  }
}

class Widget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FloatingActionButton( onPressed: () {},
                                    child: Icon(Icons.navigation),
                                    backgroundColor: Colors.green,
          ),
    );
  }
}   

class Widget3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.volume_up),
            tooltip: 'Increase volume by 10',
            onPressed: () {}
            ),
          Text('Volume : Increasing')
        ],
      ),      
    );
  }
}


class Widget4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () {},
                child: Text(
                  "I am Flat Button",
                  style: TextStyle(fontSize: 20.0),
                ),
                )
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var counter = 0;
  List<Widget> dynWidgets = [  Widget1(), Widget2(), Widget3(), Widget4() ];

  Function changeWidgets = (){
      print("pressed the button");
  };

  @override
  Widget build(BuildContext context) {


    return Container(

        child: Column(
          children: <Widget>[

              Text('Below Widget will change as you press the button at bottom', textAlign: TextAlign.center ),

              dynWidgets[counter],

              Padding(
                padding: EdgeInsets.all(8.0),
                child: RaisedButton( child: Text('Replace Widgets'), onPressed: changeWidgets,),
              )

          ],
        ),
    );
  }
}