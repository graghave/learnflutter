import 'dart:async';
import 'package:fb1/home/bloc/home_bloc.dart';
import 'package:fb1/home/bloc/home_state.dart';
import 'package:fb1/home/home.dart';
import 'package:fb1/models/trip_data.dart';
import 'package:fb1/user_data.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import '../user.dart';
import './bottom_bar.dart';

import '../mytrips/my_trips_screen.dart';
import '../myfavs/my_favs_screen.dart';
import '../takepic/add_photos_screen.dart';
import '../review/add_reviews_screen.dart';

class HomeMap extends StatefulWidget {
  final User _user;
  HomeMap(User user):_user = user;
  
  _HomeMapState createState() => _HomeMapState(_user);
}

class _HomeMapState extends State<HomeMap> {

   final User _user ;
  _HomeMapState(User user):_user =  user;


  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
 
  void initState()  { 
    super.initState();
    initData();
  }

  void initData() async {
      await getUsersData().then((snapshot){
              UserData ud = snapshot[0];
              var td = TripData(ud.uid);
              int ltid = snapshot[1].documents[0]['tid'];
              td.setLastId(ltid);
              print("uid and ltid are as ${ud.uid} & $ltid");
      });
     
  }
  Future<List> getUsersData() async {
      return [ await _user.getUserData(), await TripData.getLastTripId() ];
  }

 Widget build(BuildContext context) {
    return Scaffold(
              
              body: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  
                  print("now the state in mapbody is ${state.runtimeType}");

                  if( state is InitialHomeState){

                    return  googleMap();
                  }else if(state is ShowMyTripsState){

                    return myTrips();
                  }else if( state is ShowMyFavsState){

                    return myFavs();
                  }else if( state is AddPhotoState){

                    return addPhotos();
                  }else if( state is AddReviewState){

                    return addReviews();
                  }else{
                    return googleMap();
                  }

               },
              ),
              
              bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  print("now the state in mapbottom is ${state.runtimeType}");
                  return BottomBar(_user);
                },
              ),
              
    );
  }

  Widget googleMap() {
    final Completer<GoogleMapController> _controller = Completer();
    return FutureBuilder(
      future: Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high),
      initialData: Position(longitude: 0.0, latitude: 0.0),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        CameraPosition curPos = CameraPosition(
                                  target: LatLng((snapshot.data as Position).latitude,(snapshot.data as Position).longitude, ),
                                  zoom: 14.4746,
                                );
        return GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: curPos,
              onMapCreated: (GoogleMapController controller) { _controller.complete(controller); },
            );
      },
    );
    
    // final Completer<GoogleMapController> _controller = Completer();
    // // Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
 
    // return GoogleMap(
    //           mapType: MapType.normal,
    //           initialCameraPosition: _kGooglePlex,
    //           onMapCreated: (GoogleMapController controller) { _controller.complete(controller); },
    //         );
  }

  Widget myTrips(){
    return MyTripsScreen();
           
  }

  Widget myFavs(){ return MyFavsScreen();}

  Widget addPhotos(){ return AddPhotosScreen();}

  Widget addReviews(){ return AddReviewsScreen();}

}
