import 'package:fb1/mytrips/bloc/my_trips_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../user.dart';
import './bloc/home_state.dart';
import './bloc/home_event.dart';
import './bloc/home_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBar extends StatefulWidget {
  final User _user;
  BottomBar(User u):_user=u;

  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

    HomeBloc _homeBloc;

  
    void initState() { 
      _homeBloc = BlocProvider.of<HomeBloc>(context);
      super.initState();
    }

    Widget build(BuildContext context) {
      HomeState cstate = _homeBloc.currentState;
      print("State type is as  ${cstate.runtimeType}");
      int index = getCurIndex(cstate);
      if(cstate is TrackNewTripState || cstate is TrackOldTripState || cstate is AddPhotoState || cstate is AddReviewState){
          return whenTracking(context,index);
        } else {
          return whenNotTracking(context,index);
        }
    }

    int getCurIndex(HomeState hs){
      if(hs is TrackNewTripState || hs is TrackOldTripState || hs is InitialHomeState ){
        return 0;
      }else if(hs is ShowMyTripsState || hs is AddPhotoState){
        return 1;
      }else if(hs is ShowMyFavsState || hs is AddReviewState){
        return 2;
      }else{
        print("did not meet any bottom nav select state");
        return 0;
      }  
    }

    Widget whenTracking(BuildContext context, int sel) {

      _onTap(int index) async {
          switch(index){
            case 0: _homeBloc.dispatch(StopTrackTrip()); break;

            case 1: _homeBloc.dispatch(TakePics()) ;  break;
            case 2: _homeBloc.dispatch(AddReviews()); break;
            default: break;
          }
       }
        return BottomNavigationBar(

          items: <BottomNavigationBarItem>[

            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.stopCircle), title: Text('Stop Trip'), ),

            BottomNavigationBarItem( icon: Icon(Icons.picture_in_picture_alt), title: Text('Add Pic')),

            BottomNavigationBarItem( icon: Icon(Icons.record_voice_over), title: Text('Review')),

          ],

          currentIndex: sel,
          selectedItemColor: Colors.red,
          // onTap: _onTap,
          onTap: _onTap,
        
        );
      
    }  

    Widget whenNotTracking(BuildContext context, int sel) {

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

              case 1: _homeBloc.dispatch(MyTrips()); break;  
              case 2: _homeBloc.dispatch(MyFavs()); break;
              default: break;
            }
          }

          return BottomNavigationBar(
              
              items: <BottomNavigationBarItem>[

                BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.tripadvisor), title: Text('Start Trip')),

                BottomNavigationBarItem( icon: Icon(Icons.train), title: Text('My Trips')),

                BottomNavigationBarItem( icon: Icon(Icons.favorite), title: Text('Favourites')),

              ],

              currentIndex: sel,
              // fixedColor: Colors.deepPurple,
              selectedItemColor: Colors.red,
              onTap: _onTap,
    
          );

      
    }  


    void dispose() {
      super.dispose();
    }
}