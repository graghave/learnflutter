import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MyTripsEvent extends Equatable {
  MyTripsEvent([List props = const <dynamic>[]]) : super(props);
}
