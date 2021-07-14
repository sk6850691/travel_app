import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:travel_app/providers/bikeprovider.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/providers/trekkingprovider.dart';
import 'package:travel_app/widgets/TrekingWidget.dart';

import 'AdventuresScreen.dart';
class Experiences extends StatefulWidget {
  const Experiences({Key key}) : super(key: key);

  @override
  _ExperiencesState createState() => _ExperiencesState();
}

class _ExperiencesState extends State<Experiences> {
  @override
  Widget build(BuildContext context) {

    final trekkingProvider  = Provider.of<TrekingProvider>(context);



    return Scaffold(
      appBar: AppBar(),
      body:SingleChildScrollView(
        child: Column(
          children:[
            Stack(
              children:[ Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),



                  child:Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/shine-of-coins-601fb.appspot.com/o/Hills-near-Chennai.jpg?alt=media&token=ebf63e79-0644-4f05-8918-fdaed1705fcb',
                    fit: BoxFit.cover,
                  )
              ),
                Container(
                  width: 350,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.only(top: 100,left: 60),
                      child: FloatingSearchAppBar(


                      ),
                    ),
                  ),
                )

            ]),

            SizedBox(height: 10,),
            Text('All of our Camps',style: GoogleFonts.lato(fontSize: 20,fontWeight: FontWeight.normal,fontStyle: FontStyle.italic),)


            ,Container(



             child:ListView.builder(
               shrinkWrap: true,
                 physics: NeverScrollableScrollPhysics(),

                 itemCount: trekkingProvider.treks.length,
                 itemBuilder: (context,index){
                   return GestureDetector(
                       onTap: (){

                         Navigator.push(context, MaterialPageRoute(builder: (context)=>AdventureScreen(trek: trekkingProvider.treks[index],)));},
                       child: Trekkingwidget(trekkingModel: trekkingProvider.treks[index],

                       ),
                   );
                 })


           )

    ]),
      ));
  }
}
