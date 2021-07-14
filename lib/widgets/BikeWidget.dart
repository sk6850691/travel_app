import 'package:flutter/material.dart';
import 'package:travel_app/models/bikemodel.dart';
import 'package:travel_app/screens/BookingPage.dart';
class BikeWidget extends StatefulWidget {
  final BikeModel bikeModel;
  const BikeWidget({Key key, this.bikeModel}) : super(key: key);

  @override
  _BikeWidgetState createState() => _BikeWidgetState();
}

class _BikeWidgetState extends State<BikeWidget> {
  @override
  Widget build(BuildContext context) {
    return  Card(

      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Container(
          width: 300,
          child: Column(
            children: [
              Text(widget.bikeModel.name),
              Text(widget.bikeModel.price.toString()),
              Text(widget.bikeModel.location.toString()),

            ],
          ),
        ),
      ),
    );
  }
}
