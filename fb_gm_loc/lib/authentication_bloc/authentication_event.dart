import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const <dynamic>[]]) : super(props);
}

class AppStarted extends AuthenticationEvent {
  String toString() => 'AppStarted';
}

class Authenticating extends AuthenticationEvent {
  String toString() => 'Authenticating';
}

class LoggedIn extends AuthenticationEvent {
  String toString() => 'LoggedIn';
}

class LoggedOut extends AuthenticationEvent {
  String toString() => 'LoggedOut';
}