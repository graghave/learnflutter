import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class MyTripsBloc extends Bloc<MyTripsEvent, MyTripsState> {
  @override
  MyTripsState get initialState => InitialMyTripsState();

  @override
  Stream<MyTripsState> mapEventToState(
    MyTripsEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
