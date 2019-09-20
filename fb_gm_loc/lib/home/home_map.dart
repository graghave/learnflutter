import 'dart:async';
import 'package:fb1/home/bloc/home_bloc.dart';
import 'package:fb1/home/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../user.dart';
import './bottom_bar.dart';

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
     BlocBuilder<HomeBloc, HomeState>(
       builder: (context, state) {
         return Scaffold(
                  body: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) { _controller.complete(controller); },
                  ),
                  bottomNavigationBar: BottomBar(_user),
         ); 
       },
     );
  }
}