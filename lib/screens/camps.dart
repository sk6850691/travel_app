import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/providers/trekkingprovider.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/screens/CampBookingPage.dart';
import 'package:travel_app/widgets/CampWidget.dart';
import 'package:travel_app/widgets/TrekingWidget.dart';
class Camps extends StatefulWidget {
  const Camps({Key key}) : super(key: key);

  @override
  _CampsState createState() => _CampsState();
}

class _CampsState extends State<Camps> {

  @override
  Widget build(BuildContext context) {
    final trekkingProvider = Provider.of<TrekingProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(

        child: Container(




          child: ListView.builder(
            shrinkWrap: true,
              itemCount: trekkingProvider.camps.length,
              itemBuilder: (context,index){
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CampBookingPage()));
                  },
                  child: CampWidget(
                    campModel: trekkingProvider.camps[index],
                  ),
                );
              })
                  ),
      ),
    );
  }
}
