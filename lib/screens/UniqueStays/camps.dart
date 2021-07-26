import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/models/campmodel.dart';
import 'package:travel_app/providers/trekkingprovider.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/screens/camps/CampBookingPage.dart';
import 'package:travel_app/screens/camps/campdetails.dart';
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

        child: Column(




          children:[
            
            Container(
              child: Stack(
                children: [
                  Image.network('https://images.unsplash.com/photo-1503220317375-aaad61436b1b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',fit: BoxFit.fill,),
                  Padding(

                      padding: EdgeInsets.only(left: 50,top: 40),
                      child: Text('Explore Camps', style: GoogleFonts.lato(color: Colors.white,fontSize: 30),))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('All of our Camps', style: GoogleFonts.lato(fontSize: 30,fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 10,),
            
            ListView.builder(
            shrinkWrap: true,
              itemCount: trekkingProvider.camps.length,
              itemBuilder: (context,index){
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CampDetails(campmodel: trekkingProvider.camps[index],)));
                  },
                  child: CampWidget(
                    campModel: trekkingProvider.camps[index],
                  ),
                );
              })
                  ]),
      ),
    );
  }
}
