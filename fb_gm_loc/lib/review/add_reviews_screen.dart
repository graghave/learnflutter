import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../user.dart';
import './bloc/bloc.dart';

class AddReviewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => AddReviewsBloc(),
      child: Scaffold(
        body: Center(child: Text('Add Reviews about current location'),)
      ),
    );
  }
}