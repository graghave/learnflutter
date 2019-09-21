import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AddReviewsState extends Equatable {
  AddReviewsState([List props = const <dynamic>[]]) : super(props);
}

class InitialAddReviewsState extends AddReviewsState {}
