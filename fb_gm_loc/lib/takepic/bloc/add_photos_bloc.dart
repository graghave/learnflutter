import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class AddPhotosBloc extends Bloc<AddPhotosEvent, AddPhotosState> {
  @override
  AddPhotosState get initialState => InitialAddPhotosState();

  @override
  Stream<AddPhotosState> mapEventToState(
    AddPhotosEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
