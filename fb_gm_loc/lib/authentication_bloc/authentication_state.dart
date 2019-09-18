import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  AuthenticationState([List props = const <dynamic>[]]) : super(props);
}

class InitialAuthenticationState extends AuthenticationState {}

class Uninitialized extends AuthenticationState {
  
  String toString() => 'Uninitialized';
}

class Authenticated extends AuthenticationState {
  final String name;

  Authenticated(this.name):super([name]);
  String toString() => 'Authenticated';
}

class Unauthenticated extends AuthenticationState {
  
  String toString() => 'Unauthenticated';
}