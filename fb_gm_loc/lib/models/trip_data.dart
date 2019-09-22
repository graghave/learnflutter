import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TripData {
  static final TripData _singleton = new TripData._internal();
  static  String uid;
  static int ltid;
  static bool newTrip = false;
  static bool tripStopped = false;

  static final Duration saveDuration = Duration(seconds: 60);

  factory TripData(String userId) { uid = userId; return _singleton; }
  factory TripData.bare(){return _singleton;}
  TripData._internal();

  var gpslist = [];
  static StreamSubscription<Position> positionStream ;

    static Future<QuerySnapshot> getLastTripId() async   {

    // Firestore.instance.collection('trip').add({'uid' : 'abcde', 'tid':1 });
    // int lastid = 10;
    

    return await Firestore.instance.collection('trip')
                      .where('uid', isEqualTo: uid )
                      .orderBy('tid', descending: true)
                      .limit(1)
                      .getDocuments();
               

                      
  }

  void setLastId(int lid){
    ltid = lid;
  }

  void startSavingPositions({bool nt : false}){
      var geolocator = Geolocator();
      var locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 20);
      tripStopped = false;
      gpslist.clear();

      if(nt){ 
        newTrip = nt; 
        ltid++; 
        insertNewTripData();
      }else{
         newTrip = false ;
      }

      Timer timer = Timer.periodic(saveDuration, updateTripData);

      positionStream = geolocator.getPositionStream(locationOptions).listen(
            

          (Position position) {
              print(position == null ? 'Unknown' : position.latitude.toString() + ', ' + position.longitude.toString());
              gpslist.add({ 'lat': position.latitude, 'lng':position.longitude , 'dt': DateTime.now().toString()});
      });
  }

  void stopSavingPositions(){
    
    //  if( newTrip )  {
    //     insertNewTripData();
    //  } else {
    //     updateTripData();
    //  }
     tripStopped = true;
     positionStream.cancel();
  }

  void insertNewTripData({ tid: 0 , glist: 0  } ) {
    List gpsdata;
    int tripId;
    if( tid == 0 && glist == 0){
      tripId = ltid;
      gpsdata = gpslist;
    } else {
      gpsdata = glist;
      tripId  = tid;
    }
    print("gps arr is as $gpsdata  tid is $tripId uid is $uid ");  
    Firestore.instance.collection('trip').add( {
         'uid': uid,
         'tid': tripId,
         'gps': gpsdata,
      } );
  }

  void updateTripData( Timer timer )  {
         Firestore.instance.collection('trip')
                      .where('uid', isEqualTo: uid )
                      .where('tid', isEqualTo: ltid ) 
                      .getDocuments()
                      .then((snapshot){
                          List oldData = snapshot.documents[0]['gps'];
                          print("existing data for trip $ltid is as $oldData");
                          List tmp = new List.from(oldData)..addAll(gpslist);
                          // tmp.add(gpslist.);
                          Firestore.instance.collection('trip')
                              .document(snapshot.documents[0].documentID)
                              .updateData({'gps': tmp});
                          // insertNewTripData(tid:ltid, glist: tmp);
                          gpslist.clear(); 
                      });

         if(tripStopped == true) timer.cancel();             
  }

  static Stream<QuerySnapshot> getMyTrips(){
      return Firestore.instance.collection('trip').where('uid', isEqualTo: uid ).snapshots();
  }
}
