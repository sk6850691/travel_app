import 'package:flutter/material.dart';
import 'package:travel_app/providers/bikeprovider.dart';
import 'package:travel_app/screens/BookingPage.dart';
import 'package:travel_app/widgets/BikeWidget.dart';
import 'package:provider/provider.dart';
class ScootyDetails extends StatefulWidget {
  const ScootyDetails({Key key}) : super(key: key);

  @override
  _ScootyDetailsState createState() => _ScootyDetailsState();
}

class _ScootyDetailsState extends State<ScootyDetails> {
  @override
  Widget build(BuildContext context) {

    final bikeprovider = Provider.of<BikeProvider>(context);
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            height: 300,
            width: 500,
            child: PageView(
              children: [
                Image.network('https://firebasestorage.googleapis.com/v0/b/shine-of-coins-601fb.appspot.com/o/honda_activa_1_20180903_571_855.jpg?alt=media&token=8817e8bc-b867-429e-9e2e-e701632d3fc1',fit: BoxFit.fill,),
                Image.network('https://firebasestorage.googleapis.com/v0/b/shine-of-coins-601fb.appspot.com/o/Honda-Activa-6G-front.jpg?alt=media&token=fadaffac-d702-4118-9ac1-33821f90b11f',fit: BoxFit.fill,)
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Text('Scooty Rentals in Himachal'),

            ],
          ),

          Container(
            height: 300,
            width: 200,

            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
              return BikeWidget(bikeModel: bikeprovider.bikes[index],);
            },
                separatorBuilder:   (BuildContext context, int index) => const SizedBox(width: 30,),
                itemCount: bikeprovider.bikes.length),
          ),

          ListTile(
            leading: Text('875'),
            trailing: MaterialButton(
              child: Text('Book Now'),
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>BookingPage()));
              },
            ),
          )
        ],
      ),

    );
  }
}
