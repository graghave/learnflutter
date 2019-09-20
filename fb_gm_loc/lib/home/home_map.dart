import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../user.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeMap extends StatelessWidget {
  final User _user;
  final Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  HomeMap(User user):_user = user;

  @override
  Widget build(BuildContext context) {
     return new Scaffold(
        
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) { _controller.complete(controller); },
        ),

        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: (){},
        //   label: Text('To the lake!'),
        //   icon: Icon(Icons.directions_boat),
        // ),
      ); 

    ;
  }
}