import 'package:flutter/material.dart';
import '../user.dart';
import '../register/register.dart';

// import 'package:flutter_firebase_login/register/register.dart';

class CreateAccountButton extends StatelessWidget {
  final User _user;

  CreateAccountButton({Key key, @required User  user}) : _user = user, super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(

      child: Text( 'Create an Account', ),

      onPressed: () {
        Navigator.of(context).push( MaterialPageRoute(builder: (context) {
            return RegisterScreen(user: _user);
          }),
        );
      },
    );
  }
}
