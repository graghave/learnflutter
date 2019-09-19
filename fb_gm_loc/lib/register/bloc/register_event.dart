import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RegisterEvent extends Equatable {
  RegisterEvent([List props = const <dynamic>[]]) : super(props);
}


class EmailChanged extends RegisterEvent {
  final String email;
  EmailChanged({this.email}):super([email]);
 
  String toString() => 'EmailChanged { email :$email }';
}

class PasswordChanged extends RegisterEvent {
  final String password;
  PasswordChanged({this.password}):super([password]);
 
  String toString() => 'PasswordChanged { password :$password }';
}


class Submitted extends RegisterEvent {
  final String email;
  final String password;

  Submitted({@required this.email, @required this.password}) : super([email, password]);

  
  String toString() {
    return 'Submitted { email: $email, password: $password }';
  }
}
