import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';
import '../../user.dart';
import '../../validators.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {

  final User _user;
  RegisterBloc({User user}):_user=user;
  
  RegisterState get initialState => RegisterState.empty();

  
  Stream<RegisterState> mapEventToState( RegisterEvent event, ) async* {

    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    } else if (event is Submitted) {
      yield* _mapFormSubmittedToState(event.email, event.password);
    }
  }

  Stream<RegisterState> _mapEmailChangedToState(String email) async* {
    yield currentState.update( isEmailValid: Validators.isValidEmail(email), );
  }

  Stream<RegisterState> _mapPasswordChangedToState(String password) async* {
    yield currentState.update( isPasswordValid: Validators.isValidPassword(password), );
  }

  Stream<RegisterState> _mapFormSubmittedToState( String email, String password,) async* {

    yield RegisterState.loading();
    try {
      await _user.signUp( email: email, password: password, );
      yield RegisterState.success();
    } catch (_) {
      yield RegisterState.failure();
    }
  }
}


