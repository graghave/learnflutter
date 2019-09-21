import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class MyFavsBloc extends Bloc<MyFavsEvent, MyFavsState> {
  @override
  MyFavsState get initialState => InitialMyFavsState();

  @override
  Stream<MyFavsState> mapEventToState(
    MyFavsEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
