import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MyFavsState extends Equatable {
  MyFavsState([List props = const <dynamic>[]]) : super(props);
}

class InitialMyFavsState extends MyFavsState {}
