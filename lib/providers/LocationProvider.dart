import 'package:flutter/cupertino.dart';
import 'package:travel_app/services/locationservices.dart';

class LocationProvider with ChangeNotifier{

  List locations = [];
  LocationService service = LocationService();

  LocationProvider.initialize(){

    getLocation();
  }

  getLocation()async{

    locations = await service.getlocations();
    notifyListeners();


  }



}