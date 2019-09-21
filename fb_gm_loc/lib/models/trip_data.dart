import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TripData {
  static final TripData _singleton = new TripData._internal();
  static  String uid;
  static int ltid;
  factory TripData(String userId) { uid = userId; return _singleton; }
  factory TripData.bare(){return _singleton;}
  TripData._internal();

  var gpslist = [];
  static StreamSubscription<Position> positionStream ;

    static Future<prefix0.QuerySnapshot> getLastTripId() async   {

    // Firestore.instance.collection('trip').add({'uid' : 'abcde', 'tid':1 });
    // int lastid = 10;
    

    return await Firestore.instance.collection('trip')
                      .where('uid', isEqualTo: 'abcd')
                      .orderBy('tid', descending: true)
                      .limit(1)
                      .getDocuments();
                      // .snapshots();
                      // .forEach((f) { ltid = f.documents[0]['tid']; print("$ltid");});

    // var a = FutureBuilder<QuerySnapshot>(
    //   future: snap,
    //   initialData: null,
    //   builder: (BuildContext context, AsyncSnapshot snapshot) {
    //             ltid = snapshot.data.documents[0]['tid'];
    //             print("in futurebldr $ltid");
    //             return Container();
    //   },
    // );
    // print('already came here ');
    // return ltid;

                      
  }

  void setLastId(int lid){
    ltid = lid;
  }

  void startSavingPositions({bool newTrip : false}){
      var geolocator = Geolocator();
      var locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
      
      if(newTrip) ltid++;

      positionStream = geolocator.getPositionStream(locationOptions).listen(
            

          (Position position) {
              print(position == null ? 'Unknown' : position.latitude.toString() + ', ' + position.longitude.toString());
              gpslist.add({ 'lat': position.latitude, 'lng':position.longitude});
      });
  }

  void stopSavingPositions(){
     print("gps arr is as $gpslist");    
     Firestore.instance.collection('trip').add( {
         'uid': uid,
         'tid': ltid,
         'gps': gpslist,
      } );

      positionStream.cancel();
  }


}
