import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import './bloc.dart';

import '../user.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {


  final User _user ;

  AuthenticationBloc({@required User user}): _user = user;


  @override
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState( AuthenticationEvent event, ) async* {

    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    }

  }
}
