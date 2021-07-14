import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_app/widgets/locationwidget.dart';

class BikeModel{

  static const Location = "location";
  static const NAME = "name";
  static const PRICE = "price";
  static const QUANTITY = "quantity";


  String _location;
  String _name;
  int _price;
  int _quantity;

  get location=> _location;
  get name =>_name;
  get price =>_price;
  get quantity =>_quantity;

  BikeModel.fromSnapshot(DocumentSnapshot snapshot){

    _location = snapshot.data()[Location];
    _name = snapshot.data()[NAME];
    _price = snapshot.data()[PRICE];
   _quantity = snapshot.data()[QUANTITY];




  }

}