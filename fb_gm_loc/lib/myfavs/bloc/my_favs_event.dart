import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MyFavsEvent extends Equatable {
  MyFavsEvent([List props = const <dynamic>[]]) : super(props);
}
