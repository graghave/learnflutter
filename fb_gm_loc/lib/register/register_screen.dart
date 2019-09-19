import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../user.dart';
import './register.dart';

class RegisterScreen extends StatelessWidget {
  final User _user;

  RegisterScreen({Key key, @required User user}): assert(user != null),_user = user, super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Center(
        child: BlocProvider<RegisterBloc>(
          builder: (context) => RegisterBloc(user: _user),
          child: RegisterForm(),
        ),
      ),
    );
  }
}
