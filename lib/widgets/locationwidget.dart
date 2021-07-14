import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:travel_app/models/locationmodel.dart';
class LocationWidget extends StatelessWidget {
  final LocationModel locationModel;
  const LocationWidget({Key key, this.locationModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

     
      child: Stack(
        children:[

          ClipRRect(
         borderRadius: BorderRadius.circular(20),
          child: Image.network(locationModel.image.toString(),fit: BoxFit.cover,filterQuality: FilterQuality.high ,)
    ),
          Padding(
              padding: EdgeInsets.all(30),
              
              child: Text('Places',style: TextStyle(color: Colors.red,fontSize: 40),)),
      ]));
  }
}
