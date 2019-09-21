import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../user.dart';
import './bloc/home_state.dart';
import './bloc/home_event.dart';
import './bloc/home_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBar extends StatefulWidget {
  final User _user;
  HomeState _homeState;
  BottomBar(User u, HomeState hs):_user=u, _homeState = hs;

  _BottomBarState createState() => _BottomBarState(_homeState);
}

class _BottomBarState extends State<BottomBar> {

    HomeBloc _homeBloc;
    HomeState _homeState;

    _BottomBarState(HomeState hs):_homeState = hs;

  
    void initState() { 
      _homeBloc = BlocProvider.of<HomeBloc>(context);
      super.initState();
    }

    Widget build(BuildContext context) {
      print(" State type is as  ${_homeState.runtimeType}");
      if(_homeState is TrackNewTripState || _homeState is TrackOldTripState){
          return whenTracking(context);
        } else {
          return whenNotTracking(context);
        }
    }

    Widget whenTracking(BuildContext context) {
        return BottomNavigationBar(

          items: <BottomNavigationBarItem>[

            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.stopCircle), title: Text('Stop Trip')),

            BottomNavigationBarItem( icon: Icon(Icons.picture_in_picture_alt), title: Text('Add Pic')),

            BottomNavigationBarItem( icon: Icon(Icons.record_voice_over), title: Text('Review')),

          ],

          currentIndex: 0,
          fixedColor: Colors.deepPurple,
          // onTap: _onTap,
          onTap: (int sel){},
        
        );
      
    }  

    Widget whenNotTracking(BuildContext context) {
         _onTap(int index) async {

            switch (index) {
              
              case 0:
                await showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB( 0.0, 1000.0,1000.0, 1000.0 ),
                  items: [
                    PopupMenuItem( 
                      child: ListTile( leading: Icon(Icons.create_new_folder), title: Text('New Trip'), onTap: (){Navigator.pop(context);print('dispatching 1'); _homeBloc.dispatch( TrackNewTrip() ); },)
                    ),
                    PopupMenuItem(
                      child: ListTile( leading: Icon(Icons.collections), title: Text('Continue Last'), onTap: (){Navigator.pop(context);_homeBloc.dispatch( TrackOldTrip() ); },)
                    ),
                  ],
                  elevation: 8.0,
                );
                break;
              default: break;
            }
          }

          return BottomNavigationBar(
              
              items: <BottomNavigationBarItem>[

                BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.tripadvisor), title: Text('Start Trip')),

                BottomNavigationBarItem( icon: Icon(Icons.train), title: Text('My Trips')),

                BottomNavigationBarItem( icon: Icon(Icons.favorite), title: Text('Favourites')),

              ],

              currentIndex: 0,
              // fixedColor: Colors.deepPurple,
              selectedItemColor: Colors.red,
              onTap: _onTap,
    
          );

      
    }  


    void dispose() {
      super.dispose();
    }
}