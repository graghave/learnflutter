import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'user.dart';

import 'authentication_bloc/bloc.dart';
import 'login/login.dart';


void main(){
    final User user = User();

    runApp(
      BlocProvider(
        builder: (context) => AuthenticationBloc(user: user)..dispatch(AppStarted()),
        child:App(user),
      )
    );
}

class App extends StatelessWidget {
  final User _user;

  // App({Key key, @required User user}):_user=user, super(key: key);
  App(this._user);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          
            if(state is Unauthenticated){
                return  LoginScreen( _user );
            }else if(state is Authenticated){
                return HomeScreen();
            }else{
                return  SplashScreen();
            }
        },
      )
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Center(child: Text('Splash Screen')),
    );
  }
}