import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class AddReviewsBloc extends Bloc<AddReviewsEvent, AddReviewsState> {
  @override
  AddReviewsState get initialState => InitialAddReviewsState();

  @override
  Stream<AddReviewsState> mapEventToState(
    AddReviewsEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
