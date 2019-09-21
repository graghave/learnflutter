import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AddReviewsEvent extends Equatable {
  AddReviewsEvent([List props = const <dynamic>[]]) : super(props);
}
