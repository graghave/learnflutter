import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoogleLoginButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return RaisedButton.icon(
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(30.0), ),
      icon: Icon(FontAwesomeIcons.google, color: Colors.white),
      label: Text('Sign in with Google', style: TextStyle(color: Colors.white)),
      color: Colors.redAccent,
      
      onPressed: () {
        BlocProvider.of<LoginBloc>(context).dispatch( LoginWithGooglePressed(), );
      },

      
    );
  }
}
