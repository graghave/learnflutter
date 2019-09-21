import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../user.dart';
import './bloc/bloc.dart';

class AddPhotosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => AddPhotosBloc(),
      child: Scaffold(
        body: Center(child: Text('Add Photos about current location'),)
      ),
    );
  }
}