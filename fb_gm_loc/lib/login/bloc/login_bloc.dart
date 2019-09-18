import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';
import '../../user.dart';
import 'package:meta/meta.dart';



class LoginBloc extends Bloc<LoginEvent, LoginState> {

   final User _user ;

  LoginBloc({@required User user}): _user = user;

  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
