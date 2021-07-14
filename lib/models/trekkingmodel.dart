import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class TrekkingModel{
  String _id;
  String _description;
  String _price;
  List _image = [];
  String _location;


  get id => _id;
  get description=>_description;
  get price=> _price;
  get image=>_image;
  get location =>_location;





  TrekkingModel.fromSnapshot(DocumentSnapshot snapshot){

    _image = snapshot.data()['image'];
    _id = snapshot.data()['id'];
    _location= snapshot.data()['location'];
    _price =snapshot.data()['price'];
    _description = snapshot.data()['description'];





  }



}