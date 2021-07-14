import 'package:cloud_firestore/cloud_firestore.dart';

class LocationModel{

  static const IMAGE = "image";
  static const LOCATION = "location";

  String _image;
  String _location;

  get image => _image;
  get location =>_location;

  LocationModel.fromSnapshot(DocumentSnapshot snapshot){

    _image = snapshot.data()[IMAGE];
    _location = snapshot.data()[LOCATION];

  }

}