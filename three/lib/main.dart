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
      routes: {
        
        '/first': (context) => Navigation1(),
        '/second': (context) => Navigation2(),
        '/third': (context) => Navigation3(),
        '/fourth': (context) => Navigation4(),
      },
    );
  }
}

class Widget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(child: Text("i am a raised button"), onPressed: (){ Navigator.pushNamed(context, '/first'); }, ),
    );
  }
}

class Widget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FloatingActionButton( onPressed: () { Navigator.pushNamed(context, '/second');},
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
            onPressed: () {Navigator.pushNamed(context, '/third');}
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
                onPressed: () { Navigator.pushNamed(context, '/fourth'); },
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

  static int counter = 0;
  List<Widget> dynWidgets = [  Widget1(), Widget2(), Widget3(), Widget4() ];

  
  changeWidgets(){
    setState(() {
      counter++;
      if(counter == 4) counter=0;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Change widgets dynamically'),
      ),
      body: Container(
                child: Column(
                  children: <Widget>[

                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text('Below Widget will change as you press the button at bottom', textAlign: TextAlign.center , style: TextStyle(fontStyle: FontStyle.italic), ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: dynWidgets[counter],
                      ),

                      Padding(
                        padding: EdgeInsets.all(18.0),
                        child: RaisedButton( child: Text('Replace Widgets'), onPressed: () => changeWidgets(),),
                      )

                  ],
                ),
              )
    );
  }
}


class Navigation1 extends StatelessWidget {
  const Navigation1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation from Raised Button'),
      ),
      body: SizedBox(width: 300.0, height: 300.0, child: Text('Nav from Raised Button'),),
    );
  }
}

class Navigation2 extends StatelessWidget {
  const Navigation2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation from floating button'),
      ),
      body: SizedBox(width: 300.0, height: 300.0, child: Text('Nav from floatin Button'),),
    );
  }
}


class Navigation3 extends StatelessWidget {
  const Navigation3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation from Icon button'),
      ),
      body: SizedBox(width: 300.0, height: 300.0, child: Text('Nav from Icon Button'),),
    );
  }
}


class Navigation4 extends StatelessWidget {
  const Navigation4({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation from Flat button'),
      ),
      body: SizedBox(width: 300.0, height: 300.0, child: Text('Nav from flat Button'),),
    );
  }
}
