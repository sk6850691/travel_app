import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/screens/cottages.dart';
import 'package:travel_app/screens/resorts.dart';

import 'package:travel_app/screens/villas.dart';

import 'camps.dart';
import 'homestays.dart';
class UniqueStays extends StatefulWidget {
  const UniqueStays({Key key}) : super(key: key);

  @override
  _UniqueStaysState createState() => _UniqueStaysState();
}

class _UniqueStaysState extends State<UniqueStays> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              child: Image.network('https://firebasestorage.googleapis.com/v0/b/shine-of-coins-601fb.appspot.com/o/cover-for-homestays-in-shimla_28th-nov.jpg?alt=media&token=bc8b3e04-4eca-4cb6-af54-dd6b33b72952',fit: BoxFit.cover,),
            ),

            SizedBox(
              height: 20,
            ),
            Text('Whats in Unique stays',style: GoogleFonts.lato(fontStyle: FontStyle.normal,fontSize: 30,fontWeight: FontWeight.normal),),
            SizedBox(
              height: 20,
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal ,
              child: Row(

                children: [
                  Container(
                    height: 300,
                    width: 300,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Camps()));
                      },
                      child: Stack(
                        children: [
                          ClipRRect(
                            child:
                            Image.network('https://firebasestorage.googleapis.com/v0/b/shine-of-coins-601fb.appspot.com/o/shutterstock_597509039.jpg?alt=media&token=0137321f-a4f6-4983-91e9-9c30a2f759b1'),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 30,left: 30),

                              child: Text('Camps',style:  GoogleFonts.caveat(color:Colors.white,fontStyle: FontStyle.italic,fontSize: 50,fontWeight: FontWeight.normal),))],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 300,
                    width: 300,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Cottages()));
                      },
                      child: Stack(
                        children: [
                          ClipRRect(child: Image.network('https://firebasestorage.googleapis.com/v0/b/shine-of-coins-601fb.appspot.com/o/leela.jpg?alt=media&token=61612885-2cee-427a-b601-71e7e9d214e9'),

                            borderRadius: BorderRadius.circular(20),),
                          Padding(
                              padding: EdgeInsets.only(top: 30,left: 30),
                              child: Text('Cottages',style:  GoogleFonts.caveat(color:Colors.white,fontStyle: FontStyle.italic,fontSize: 50,fontWeight: FontWeight.normal),))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 300,
                    width: 300,
                    child: GestureDetector(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeStays()));
                      } ,
                      child: Stack(
                        children: [
                          Image.network('https://firebasestorage.googleapis.com/v0/b/shine-of-coins-601fb.appspot.com/o/Cover-for-kabini-homestays.jpg?alt=media&token=777f2258-c21a-466e-9160-fdcded7db469'),
                          Text('HomeStays',style:  GoogleFonts.caveat(color:Colors.white,fontStyle: FontStyle.italic,fontSize: 50,fontWeight: FontWeight.normal))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 300,
                    width: 300,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Villas()));
                      },
                      child: Stack(
                        children: [
                          ClipRRect(


                            child: Image.network('https://firebasestorage.googleapis.com/v0/b/shine-of-coins-601fb.appspot.com/o/cf5e396218a1f7e.gif?alt=media&token=fc6ce93c-8a5a-45fa-9e51-54b789056ec7')
                            ,borderRadius: BorderRadius.circular(20),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 30,left: 30),
                              child: Text('Villas',style:  GoogleFonts.caveat(color:Colors.white,fontStyle: FontStyle.italic,fontSize: 50,fontWeight: FontWeight.normal),))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 300,
                    width: 300,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Resorts()));
                      },
                      child: Stack(
                        children: [
                          ClipRRect(


                            child: Image.network('https://firebasestorage.googleapis.com/v0/b/shine-of-coins-601fb.appspot.com/o/45410804291_1993248528_b_20190810152300.jpg?alt=media&token=0cc675a6-bd6b-426e-9fc5-d7bbef50f072')
                            ,borderRadius: BorderRadius.circular(20),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 30,left: 30),
                              child: Text('Resorts',style:  GoogleFonts.caveat(color:Colors.white,fontStyle: FontStyle.italic,fontSize: 50,fontWeight: FontWeight.normal),))
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
