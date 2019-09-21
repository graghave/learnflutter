import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeEvent extends Equatable {
  HomeEvent([List props = const <dynamic>[]]) : super(props);
}

class InitialMap extends HomeEvent{
  String toString()  => 'Initial_Map';
}

class TrackOldTrip extends HomeEvent{
  String toString()  => 'Track_Old_Trip';
}

class TrackNewTrip extends HomeEvent{
  String toString()  => 'Track_New_Trip';
  
}

class StopTrackTrip extends HomeEvent{
  String toString()  => 'Stop_Track_Trip';
  
}
