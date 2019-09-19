import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const <dynamic>[]]) : super(props);
}

class EmailChanged extends LoginEvent {
    final String email;
    EmailChanged({@required this.email}) : super([email]);
    String toString() => 'EmailChanged { email :$email }';
}

class PasswordChanged extends LoginEvent {
    final String password;
    PasswordChanged({@required this.password}) : super([password]);
    String toString() => 'PasswordChanged { password :$password }';
}

class Submitted extends LoginEvent {
    final String email;
    final String password;
    Submitted({@required this.email, @required this.password}): super([email, password]);
    String toString() => 'Submitted { email :$email ,  password: $password }';
}

class LoginWithGooglePressed extends LoginEvent {

    String toString() => 'LoginWithGooglePressed ';
}


class LoginWithCredentialsPressed extends LoginEvent {
    final String email;
    final String password;

    LoginWithCredentialsPressed({@required this.email, @required this.password}):super([email, password]);

    String toString() {
       return 'LoginWithCredentialsPressed { email: $email, password: $password }';
    }
    
}