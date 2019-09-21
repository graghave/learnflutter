import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../user.dart';
import './bloc/bloc.dart';

class MyTripsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => MyTripsBloc(),
      child: Scaffold(
        body: Center(child: Text('My Trips Screen'),)
      ),
    );
  }
}