import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../user.dart';
import './login_form.dart';
import './bloc/bloc.dart';
import './bloc/login_bloc.dart';


class LoginScreen extends StatelessWidget {
  final User _user;

  LoginScreen(User user):_user=user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: BlocProvider<LoginBloc>(
        builder: (context) => LoginBloc(user: _user),
        child: LoginForm(user: _user),
      ),
    );
  }
}
