import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';
import '../../user.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final User _user ;
  HomeBloc(User user):_user = user;

  @override
  HomeState get initialState => InitialHomeState();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
