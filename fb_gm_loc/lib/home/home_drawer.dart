import 'package:flutter/material.dart';
import '../user.dart';
import '../user_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeDrawer extends StatelessWidget {
  final User _user;

  HomeDrawer(User user):_user = user;

  Widget build(BuildContext context) {
      return FutureBuilder(
        future: _user.getUserData(),
        initialData: null,
        // initialData: UserData(email:'',name:'', uid:'', photoUrl: ''),
        builder: (BuildContext context, AsyncSnapshot<UserData> snapshot) {
          return  Drawer(
              child: Column(
                children: <Widget>[

                    UserAccountsDrawerHeader(
                        accountName:  Text(snapshot.data.name ),
                        accountEmail:  Text(snapshot.data.email),

                        currentAccountPicture: new CircleAvatar(
                          backgroundColor: Colors.brown,
                          child: Image.network(snapshot.data.photoUrl)
                      ),
                    ),

                    ListTile(
                      leading: Icon(Icons.airline_seat_recline_extra),
                      title: Text('My Trips'),
                      onTap: (){},
                    ),

                    ListTile(
                      leading: Icon(Icons.favorite),
                      title: Text('My Favorites'),
                      onTap: (){},
                    ),

                    ListTile(
                      leading: Icon(FontAwesomeIcons.shareSquare),
                      title: Text('Shared by Others'),
                      onTap: (){},
                    ),


                    ListTile(
                      leading: Icon(Icons.share),
                      title: Text('Share Trip'),
                      onTap: (){},
                    ),
                    
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Settings'),
                      onTap: (){},
                    ),

                    Expanded(
                      child: new Align(
                        alignment: Alignment.bottomCenter,
                        child: ListTile(
                          leading: Icon(Icons.settings_power),
                          title: Text('Sign Out'),
                          onTap: (){},
                        )
                      ),
                    ),


                ],
              ),
            );
        },
      );
    }
}