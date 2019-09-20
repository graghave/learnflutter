import 'package:flutter/material.dart';
import '../user.dart';

class BottomBar extends StatelessWidget {
  User _user;

  BottomBar(User u):_user=u;

  Widget build(BuildContext context) {
    _onTap(int index) async {
          switch (index) {
            
            case 0:
              
              await showMenu(
                context: context,
                position: RelativeRect.fromLTRB( 0.0, 1000.0,1000.0, 1000.0 ),
                items: [
                  PopupMenuItem( 
                    child: ListTile( leading: Icon(Icons.create_new_folder), title: Text('New Trip'), onTap: (){},)
                  ),
                  PopupMenuItem(
                    child: ListTile( leading: Icon(Icons.collections), title: Text('Continue Last'), onTap: (){},)
                  ),
                ],
                elevation: 8.0,
              );
              break;
            default: ;
          }
        }

    return BottomNavigationBar(

        items: <BottomNavigationBarItem>[

          BottomNavigationBarItem(icon: Icon(Icons.star), title: Text('Start Trip')),

          // BottomNavigationBarItem( icon: Icon(Icons.train), title: Text('My Trips')),

          // BottomNavigationBarItem( icon: Icon(Icons.favorite), title: Text('Favourites')),

          BottomNavigationBarItem( icon: Icon(Icons.picture_in_picture_alt), title: Text('Add Pic')),

          BottomNavigationBarItem( icon: Icon(Icons.record_voice_over), title: Text('Review')),

        ],

        currentIndex: 0,
        fixedColor: Colors.deepPurple,
        onTap: _onTap,
      
      );
  }
}