import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../user.dart';
import './bloc/bloc.dart';
import './bloc/home_bloc.dart';
import './home_map.dart';
import './home_drawer.dart';

class HomeScreen extends StatelessWidget {
  final User _user ;

  HomeScreen(User user):_user=user;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      drawer: HomeDrawer(_user),
      body: BlocProvider(
        builder: (context) => HomeBloc(_user),
        child: HomeMap(_user),
      )
      
    );
  }
}