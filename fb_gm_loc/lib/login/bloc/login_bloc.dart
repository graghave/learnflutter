import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';
import '../../user.dart';
import '../../validators.dart';
import 'package:meta/meta.dart';



class LoginBloc extends Bloc<LoginEvent, LoginState> {

   final User _user ;

  LoginBloc({@required User user}): _user = user;

  @override
  LoginState get initialState => LoginState.empty();

  @override
  Stream<LoginState> mapEventToState( LoginEvent event, ) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    } else if (event is LoginWithGooglePressed) {
      yield* _mapLoginWithGooglePressedToState();
    } else if (event is LoginWithCredentialsPressed) {
      yield* _mapLoginWithCredentialsPressedToState(
        email: event.email,
        password: event.password,
      );
    }
  }


  Stream<LoginState> _mapEmailChangedToState(String email) async* {
    yield currentState.update( isEmailValid: Validators.isValidEmail(email), );
  }

  Stream<LoginState> _mapPasswordChangedToState(String password) async* {
    yield currentState.update( isPasswordValid: Validators.isValidPassword(password), );
  }

  Stream<LoginState> _mapLoginWithGooglePressedToState() async* {

    try {
      await _user.signInWithGoogle();
      yield LoginState.success();
    } catch (_) {
      yield LoginState.failure();
    }
  }

  Stream<LoginState> _mapLoginWithCredentialsPressedToState({ String email, String password, }) async* {
    
    yield LoginState.loading();
    try {
      await _user.signInWithCredentials(email, password);
      yield LoginState.success();
    } catch (_) {
      yield LoginState.failure();
    }
  }



}
