import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'user.dart';

import 'authentication_bloc/bloc.dart';


void main(){
    final User user = User();

    runApp(
      BlocProvider(
        builder: (context) => AuthenticationBloc(user: user)..dispatch(AppStarted()),
        child:App(user: user),
      )
    );
}

class App extends StatelessWidget {
  final User _user;

  App({Key key, @required User user}):_user=user, super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          
            switch (state) {
              case Unauthenticated: return  LoginScreen();  break;
              case Authenticated:   return HomeScreen();    break;  
              default: SplashScreen(); break;
            }

        },
      )
      
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
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
    return Container(
      
    );
  }
}