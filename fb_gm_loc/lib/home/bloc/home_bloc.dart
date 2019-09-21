import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';
import '../../user.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final User _user ;
  HomeBloc(User user):_user = user;

  @override
  HomeState get initialState => InitialHomeState();

  @override
  Stream<HomeState> mapEventToState( HomeEvent event, ) async* {

      if(event is InitialMap){
        yield* _mapIntialMapState(event);

      }else if(event is TrackOldTrip){
        print("old trip event is as ${event.runtimeType}");
        yield* _mapTrackOldTripState(event);

      }else if(event is TrackNewTrip){
        yield* _mapTrackNewTripState(event);

      }else if(event is StopTrackTrip){
        yield* _mapStopTrackTripState(event);

      }else if(event is MyTrips){
        yield* _mapMyTripsState(event);

      }else if(event is MyFavs){
        yield* _mapMyFavsState(event);

      }else if(event is TakePics){
        yield* _mapTakePicsState(event);

      }else if(event is AddReviews){
        yield* _mapAddReviewsState(event);

      }
      
  }

  Stream<HomeState> _mapIntialMapState(HomeEvent event) async* {
    print('hbloc 1');
      yield InitialHomeState();
  }

  Stream<HomeState> _mapTrackOldTripState(HomeEvent event) async* {
    print('hbloc 2');
      yield TrackOldTripState();
  }

  Stream<HomeState> _mapTrackNewTripState(HomeEvent event) async* {
    print('hbloc 3');
    yield TrackNewTripState();
  }

  Stream<HomeState> _mapStopTrackTripState(HomeEvent event) async* {
    print('hbloc 4');
    yield InitialHomeState();
  }

  Stream<HomeState> _mapMyTripsState(HomeEvent event) async* {
    print('hbloc 5');
    yield ShowMyTripsState();
  }

  Stream<HomeState> _mapMyFavsState(HomeEvent event) async* {
    print('hbloc 6');
    yield ShowMyFavsState();
  }
  
  Stream<HomeState> _mapTakePicsState(HomeEvent event) async* {
    print('hbloc 7');
    yield AddPhotoState();
  }

  Stream<HomeState> _mapAddReviewsState(HomeEvent event) async* {
    print('hbloc 8');
    yield AddReviewState();
  }

}   