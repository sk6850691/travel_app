import 'package:cloud_firestore/cloud_firestore.dart';

class CampModel{

  static const DESCRIPTION = 'description';
  static const PRICE = 'price';
  static const IMAGES = 'images';
  static const LOCATION = 'location';


  String _description;
  String _price;
  List _images = [];
  String _location;

  get description => _description;
  get price =>_price;
  get images => _images;
  get location => _location;



  CampModel.fromSnapshot(DocumentSnapshot snapshot){

    _description = snapshot.data()[DESCRIPTION];
    _price = snapshot.data()[PRICE];
    _images = snapshot.data()[IMAGES];
    _location = snapshot.data()[LOCATION];


  }


}