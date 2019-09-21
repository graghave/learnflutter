import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeState extends Equatable {
  HomeState([List props = const <dynamic>[]]) : super(props);
}

class InitialHomeState extends HomeState {

  String toString() => 'Initial_Home_State';
}

class TrackNewTripState extends HomeState {
  String toString() => 'Track_New_Trip_State';
}

class TrackOldTripState extends HomeState {
  String toString() => 'Track_Old_Trip_State';
}

class AddPhotoState extends HomeState {
  String toString() => 'Add_Photo_State';
}

class AddReviewState extends HomeState {
  String toString() => 'Add_Review_State';
}


class ShowMyTripsState extends HomeState {
  String toString() => 'Show_My_Trips_State';
}

class ShowMyFavsState extends HomeState {
  String toString() => 'Show_My_Favs_State';
}