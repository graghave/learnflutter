import 'package:flutter/material.dart';

void main() => runApp(Listview1());

class Listview1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = [
        [Icons.gif,  'Boxes',       '/boxes' ],
        [Icons.call, 'Bottom bar',  '/bb' ],
        [Icons.dns,  'Tab bar',     '/tabbar' ],
        [Icons.cake, 'Step bar',    '/stepbar' ],
        [Icons.pets, 'Login Form' ,  '/login'],
        [Icons.poll, 'Date Pickers' ,'/dpicker'],
        [Icons.face, 'Alerts' ,      '/alerts'],
        [Icons.home, 'Styling' ,     '/styling'],
        [Icons.adb, 'Tables',         '/tables'],
        [Icons.dvr, 'Data tables',    '/datatables'],
        [Icons.hd, 'Grid views',      '/grid'],
        [Icons.card_membership, 'Chips',      '/chip'],
        [Icons.fiber_dvr, 'Floating Action Button',      '/fab'],
        [Icons.nature_people, 'Popup',      '/popup'],


    ];
    return MaterialApp(
        title: 'Listview example1',
        home: Scaffold(
          appBar: AppBar(title: Text('List example1'),),
          body: ListView.separated(
                      separatorBuilder: (context,index) => Divider(color: Colors.red,),  
                      itemCount: 14,
                      itemBuilder: (context,index) => ListTile(leading: Icon(list[index][0]), title: Text(list[index][1]), onTap: () => Navigator.pushNamed(context, list[index][2]),),
                ),
        ),
        routes: {
          '/boxes':       (context) => Boxes(),
          '/bb' :         (context) => Bottombar(),
          '/tabbar' :     (context) => Tabbar(),
          '/stepbar' :    (context) => Stepbar(),
          '/login' :      (context) => Loginform(),
          '/dpicker' :    (context) => Dtimebase(),
          '/alerts' :     (context) => DAlertsbase(),
          '/styling' :    (context) => Styler1(),
          '/tables' :     (context) => Table1(),
          '/datatables' : (context) => Datatable1(),
          '/grid':        (context) => Gridview1(),
          '/chip':        (context) => Chip1(),
          '/fab':        (context) => Fab1(),
          '/popup':        (context) => Popup1(),

        },
    );
  }
}

class Popup1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Popup example'),),
      body: Center(
        child: PopupMenuButton(
          onSelected : (String result) { print(result); },

          itemBuilder : (BuildContext context) =>

            <PopupMenuEntry<String>>[
              
              PopupMenuItem( value : "copy", child : Text("Copy")),
              PopupMenuItem( value : "cut",  child : Text("Cut")),
              PopupMenuItem( value : "paste", child : Text("Paste") )

          ]
        )
      ),
    );
  }
}
class Fab1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Floating Action bar'),),
      floatingActionButton: FloatingActionButton(
        backgroundColor : Colors.red,
        foregroundColor : Colors.yellow,
        child : Icon(Icons.add),
        onPressed : () { print("Ouch! Stop it!"); }
      ),
      body: Center(
        child : Text("Click it!")
      ),
    );
  }
}
class Chip1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text('Chip example'),),
       body: Center(
              child : Chip(
                      avatar : CircleAvatar(
                        backgroundImage : AssetImage("assets/avt.png")
                      ),
                      backgroundColor : Colors.grey.shade300,
                      label : Text("Raghu Guru")
                    )
      )
    );
  }
}

class Gridview1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        appBar: AppBar(title: Text('Grid example1'),),
        body: GridView.count(
        padding : EdgeInsets.all(4.0),
        crossAxisCount : 4, childAspectRatio : 1.0,
        mainAxisSpacing : 4.0, crossAxisSpacing : 4.0,
        children: [
          GridTile(child : new FlutterLogo()),
          GridTile(child : new FlutterLogo()),
          GridTile(child : new FlutterLogo()),
          GridTile(child : new FlutterLogo()),
          GridTile(child : new FlutterLogo()),
          GridTile(child : new FlutterLogo()),
          GridTile(child : new FlutterLogo()),
          GridTile(child : new FlutterLogo()),
          GridTile(child : new FlutterLogo())
        ]
      ),
    );
  }
}
class Datatable1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Datatable Example'),),
        body:   Center( 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Spacer(),
            DataTable(
              sortColumnIndex : 1,
              columns : [
                DataColumn(label : Text("First Name")),
                DataColumn(label : Text("Last Name"))
              ],
              rows : [
                    DataRow(cells : [ DataCell(Text("Leia")), DataCell(Text("Organa"), showEditIcon : true)] ),
                    DataRow(cells : [DataCell(Text("Luke")),DataCell(Text("Skywalker")) ]),
                    DataRow(cells : [DataCell(Text("Han")), DataCell(Text("Solo")) ])
                 ],
              
            ),
            Spacer(),

          ]
          ),
      )
    );
  }
}

class Table1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
        appBar: AppBar(title: Text('Animation Example 1')),
        body: Column(
                children: <Widget>[

                     Container(height : 100),

                      Table(
                        border : TableBorder(
                          top : BorderSide(width : 2),
                          bottom : BorderSide(width : 4),
                          left : BorderSide(width : 2),
                          right : BorderSide(width : 2)
                         ),

                        children : [
                          TableRow(
                            children : [
                              Center(child : Padding(
                                padding : EdgeInsets.all(10),
                                child : Text("1"))
                              ),
                              Center(child : Padding(
                                padding :  EdgeInsets.all(10),
                                child : Text("2"))
                              ),
                              Center(child : Padding(
                                padding :  EdgeInsets.all(10),
                                child : Text("3"))
                              )
                            ]
                          )
                        ]
                      )
                ],
        ),
    );
  }
}

class Styler1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Style 1 examples'),),
        body: Column(
          children: <Widget>[

            Spacer(),

            Center(child : Opacity(opacity: .25, child : SizedBox(  child: Text("Faded") , height: 100.0, width: 100.0 )  )),

            Spacer(),

            Center(child : Theme (
              data : ThemeData( accentColor : Colors.purple ),
              child : Container(
                color : Theme.of(context).accentColor,
                child : Text("Text with a background color", style : Theme.of(context).textTheme.title, )
              )
            )),
            
            Spacer(),

            Center(child : DecoratedBox(

                          decoration : BoxDecoration(
                            gradient : LinearGradient(
                              begin : Alignment.topCenter,
                              end : Alignment.bottomCenter,
                              colors : [ Color(0xFF000000), Color(0xFFFF0000) ],
                              tileMode : TileMode.repeated
                            )
                          ),

                          child : Container(width : 100, height : 100,
                            child : Text("Hello",
                              style : TextStyle(color : Colors.white)
                            )
                          )
          )),
          Spacer(),

          Center(child : Container(
            color : Colors.yellow,
            child : Transform(
              alignment : Alignment.bottomLeft,
              transform : Matrix4.skewY(0.4)..rotateZ(-3 / 12.0),
              child : Container(
                padding : const EdgeInsets.all(12.0),
                color : Colors.red,
                child : Text("Eat a Pizza!")
              )
            )
          )),
          Spacer()

          ],
        ),
    );
  }
}

class DAlertsbase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( body: Dalerts());
  }
}

class Dalerts extends StatelessWidget {

  

  @override
  Widget build(BuildContext icontext) {
  
    Future _showIt() async {
        switch(
          await showDialog(
            context: icontext,
            builder: (BuildContext icontext ){

                return SimpleDialog(
                  title: Text("Whats your fav food"),
                  children: <Widget>[
                     SimpleDialogOption( child: Text('brocolli'), onPressed: (){ Navigator.pop(icontext, 'brocolli');},),
                     
                     SimpleDialogOption( child: Text('carrots'), onPressed: (){ Navigator.pop(icontext, 'carrots');},),

                  ],
                );
            }
          )
        ){
          case 'brocolli': print('brocolli selected'); break;
          case 'carrots':  print('carrots selected');  break;
        }
    }

    _showAdialog()  {
        return showDialog(
            context: icontext,
            barrierDismissible: false,
            builder: (BuildContext icontext ){
                return AlertDialog(
                  title: Text('Heading'),
                  content: Center(child: Text('this is the content of the alert')),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Button title'),
                      onPressed: (){Navigator.of(icontext).pop();},
                    ),
                  ],
                );
            } 
        );
    }

    _showsnackBar(){
       Scaffold.of(icontext).showSnackBar(
        SnackBar(
          backgroundColor : Colors.red,
          duration : Duration(seconds : 5),
          content : Text("I like pie!"),
          action : SnackBarAction(
            label : "Chow down",
            onPressed: () {
              print("Gettin' fat!");
            }
          )
        )
        );
    }


    _showbottomSheet(){
      showModalBottomSheet(context : icontext,
        builder : (BuildContext icontext) {
          return new Column(
            mainAxisSize : MainAxisSize.min,
            children : [
              Text("What's your favorite pet?"),
              FlatButton(child : Text("Dog"),
                onPressed : () { Navigator.of(icontext).pop(); },
              ),
              FlatButton(child : Text("Cat"),
                onPressed : () { Navigator.of(icontext).pop(); },
              ),
              FlatButton(child : Text("Ferret"),
                onPressed : () { Navigator.of(icontext).pop(); }
              )
            ]
          );
        }
      );
    }

    return Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Container(height: 50.0),

              RaisedButton(
                child: Text("Simple Dialog"),
                onPressed: _showIt,
              ),

              Container(height: 50.0),

              Tooltip(
                message: "Tapping me will end the world!",
                child: RaisedButton(
                  child: Text("Dont tap me"),
                  onPressed: () => print("Boom !"),
                ),
              ),

              Container(height: 50.0),

              RaisedButton(
                child: Text("Alert Dialog"),
                onPressed: _showAdialog,
              ),
              
              Container(height: 50.0),

              RaisedButton(
                child: Text("Snack Bar"),
                onPressed: _showsnackBar,
              ),

              Container(height: 50.0),

              RaisedButton(
                child: Text("Bottom Sheet"),
                onPressed: _showbottomSheet,
              ),

            ],
          ),
        ),
    );
  }
}

class Dtimebase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( body: Dtime());
  }
}
class Dtime extends StatelessWidget {


  Future _selectDate(icontext) async {
      DateTime selDate = await showDatePicker(
        context: icontext,
        initialDate: DateTime.now(),
        firstDate: DateTime(2017),
        lastDate: DateTime(2021),
      );
      print(selDate);
  }

Future _selectTime(icontext) async {
      TimeOfDay selTime = await showTimePicker(
        context: icontext,
        initialTime: TimeOfDay.now(),
      );   
      print(selTime);
  }


  @override
  Widget build(BuildContext icontext) {
    return Scaffold(
        appBar: AppBar(title: Text("Date Time")),
        body: Center(
          child: Column(
            children: <Widget>[

              Container(height: 50.0,),

              RaisedButton(
                child: Text("Date Picker"),
                onPressed: () => _selectDate(icontext),
              ),

              Padding(
                padding: EdgeInsets.all(30.0),
              ),
              
              RaisedButton(
                child: Text("Timee Picker"),
                onPressed: () => _selectTime(icontext),
              ),

              Container(height: 50.0,),

              Dismissible(
                  key: GlobalKey(),
                  onDismissed: (direction){ print("Goodbye $direction");},
                  child: Container(
                    color: Colors.green,
                    width: 100.0,
                    height: 50.0,
                    child: Text("Swipe me"),
                  ),
              ),
              
            ],
          ),
        ),
      );
  }
}

class Loginform extends StatefulWidget {
  @override
  _LoginformState createState() => _LoginformState();
}
class LoginData {
  String username = "";
  String password = "";
  var cbvalue = false;
  var swivalue = false;
  var slidervalue = 0.3;
  var radiovalue = 1;


}
class _LoginformState extends State<Loginform> {

  LoginData _logindata = LoginData();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  void cbChange( bool value) => setState(() => _logindata.cbvalue = value );
  void swiChange(bool value) => setState(() => _logindata.swivalue = value );
  void sliChange(var value) => setState(() => _logindata.slidervalue = value );
  void radChange(var value) => setState(() => _logindata.radiovalue = value );

  @override
  Widget build(BuildContext context) {


    return  Scaffold(
          appBar: AppBar(title: Text("Login Form"),),
          body: Container(
            padding: EdgeInsets.all(50.0),
            child: Form(
              key: _formkey,
              child: Column(
                children: <Widget>[

                  TextFormField(
                    keyboardType: TextInputType.emailAddress,

                    decoration: InputDecoration(
                      hintText: 'none@none.com',
                      labelText: 'Username - Email address'
                    ),

                    onSaved: (String uname){this._logindata.username = uname;},

                    validator: (String uname){ if(uname.length==0){ return 'Input a valid value';} return null;},

                  ),
                  TextFormField(

                    obscureText: true,

                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password'
                    ),

                    onSaved: (String uname){this._logindata.password = uname;},

                    validator: (String uname){ if(uname.length< 8){ return 'Password should be minimum 8 chars';} return null;},


                  ),

                  CheckboxListTile(
                      value: _logindata.cbvalue,
                      onChanged: cbChange,
                      title: Text('CB Test'),
                      // subtitle: Text('Subtitle'),
                      activeColor: Colors.red,
                      secondary: Icon(Icons.archive),
                      controlAffinity: ListTileControlAffinity.trailing,

                      
                  ),

                  SwitchListTile(
                      value: _logindata.swivalue,
                      onChanged: swiChange,
                      title: Text('Switchtest Test'),
                      activeColor: Colors.red,
                      secondary: Icon(Icons.cake),


                  ),

                  Slider(
                    value: _logindata.slidervalue,
                    min: 0,
                    max: 20,
                    onChanged: sliChange,
                  ),

                 
                  RadioListTile(
                    value: 1,
                    groupValue: _logindata.radiovalue,
                    onChanged: radChange,
                    activeColor: Colors.red,
                    title: Text('Radio 1'),
                    secondary: Icon(Icons.assistant),
                  ),
              
                 RadioListTile(
                    value: 2,
                    groupValue: _logindata.radiovalue,
                    onChanged: radChange,
                    activeColor: Colors.red,
                    title: Text('Radio 2'),
                    secondary: Icon(Icons.call),
                  ),

                   RadioListTile(
                    value: 3,
                    groupValue: _logindata.radiovalue,
                    onChanged: radChange,
                    activeColor: Colors.red,
                    title: Text('Radio 3'),
                    secondary: Icon(Icons.dashboard),
                  ),
              
              
                  RaisedButton(
                    child: Text('Submit'),
                    onPressed: (){ 
                        if(_formkey.currentState.validate()){
                            _formkey.currentState.save();
                            print('Username: ${_logindata.username}');
                            print('Password: ${_logindata.password}');
                        }
                    },

                  ),

                ],
              ),
            ),
          ),
    );
  }
}

class Stepbar extends StatefulWidget {
  @override
  _StepbarState createState() => _StepbarState();
}

class _StepbarState extends State<Stepbar> {
  var _current = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

          appBar: AppBar(title: Text("Stepper Example")),
          body: Stepper(

            type: StepperType.vertical,

            currentStep: _current,

            onStepContinue: _current < 2 ? () => setState(() => _current+= 1) : null ,

            onStepCancel:  _current > 0 ? () => setState(() => _current-= 1) : null ,


            steps: [

              Step( title: Text('Get Ready'), isActive: true , content: Text('Lets Begin') ),
              Step( title: Text('Get Set'), isActive: true , content: Text('Ok.. just a little more') ),
              Step( title: Text('Go!'), isActive: true , content: Text('and, we are done !') ),

            ],
          ),
    );
  }
}

class Tabbar extends StatefulWidget {
  @override
  _TabbarState createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
                length: 3,
                child: Scaffold(
                  
                  appBar: AppBar(title: Text("Tabbar example"),
                                 
                                  bottom: TabBar(
                                  tabs: [
                                    Tab(icon: Icon(Icons.announcement)),
                                    Tab(icon: Icon(Icons.cake)),
                                    Tab(icon: Icon(Icons.cloud)),
                                  ]
                                ),
                  ),
                  body: TabBarView(
                      children: <Widget>[
                        Center(child: Text("Announcements")),
                        Center(child: Text("Birthdays")),
                        Center(child: Text("Data")),
                      ],
                ),
                ),

    );
  }
}

class Bottombar extends StatefulWidget {
  @override
  _BottombarState createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {

  var _current = 0;
  var _pages = [ 
    Text("Page 1 - Announcements"),
    Text("Page 2 - Birthdays"),
    Text("Page 3 - Data"),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
              appBar: AppBar(title: Text("BottomBar")),
              body: Center(child: _pages[_current],),
              bottomNavigationBar: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(icon:Icon( Icons.announcement), title: Text("Announcements")),
                  BottomNavigationBarItem(icon:Icon( Icons.cake), title: Text("Birthdays")),
                  BottomNavigationBarItem(icon:Icon( Icons.cloud), title: Text("Data")),
                ],
                fixedColor: Colors.red,
                currentIndex: _current,
                onTap: (int selIndex){ setState(() {
                  _current = selIndex;
                });},
              ),
    );
  }
}

class Boxes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Flutter Playground")  ),
        drawer: Drawer(
          elevation: 20.0,
          
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Column(
            children: <Widget>[

              Text("Option 1"),
              Text("Option 2"),
              Divider(color: Colors.blue,),
              Text("Option 3"),
              Text("Option 4"),
            ],
          ),
         ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Hello"),
              Divider(color: Colors.red,),
              // ConstrainedBox( constraints: BoxConstraints(minHeight: 150.0),  child: Padding( padding: EdgeInsets.all(50), child: Transform.scale( scale:4, child: Text("World") ) )),
              Card( color: Colors.blue, elevation: 14.0,  child:ConstrainedBox( constraints: BoxConstraints(minHeight: 150.0),  child:FittedBox( fit: BoxFit.fill, child: RotatedBox( quarterTurns: 3, child: Text("World") ) ))),
              Divider( color: Colors.red, ),
              Text("and Good day"),
              RaisedButton(child: Text("Press Me"), onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context) => SecondRoute()) ); },),
            ],
          ),
        )
    );
  }
} 

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Route")),
      body: Center(
        child: RaisedButton(child: Text("launch me"), onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => SecondRoute()));},)
      ),
    );
  }
} 

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Second route")  ),
        body: Center(
          child: RaisedButton(child: Text("Go Back"), onPressed: (){ Navigator.pop(context);},),
        ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}