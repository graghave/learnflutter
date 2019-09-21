import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MyTripsState extends Equatable {
  MyTripsState([List props = const <dynamic>[]]) : super(props);
}

class InitialMyTripsState extends MyTripsState {}
