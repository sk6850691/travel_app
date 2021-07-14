import 'package:flutter/material.dart';
import 'package:travel_app/models/bikemodel.dart';
import 'package:travel_app/models/trekkingmodel.dart';
import 'package:travel_app/models/trekkingslider.dart';
import 'package:travel_app/services/TrekingService.dart';
import 'package:travel_app/services/bikeservices.dart';
class BikeProvider with ChangeNotifier{

  BikeService service = BikeService();
  List<BikeModel> bikes = [];




  BikeProvider.initialize(){




  }

  Future getBikes()async{

    bikes = await service.getBikes();
    notifyListeners();
  }






}