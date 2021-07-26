import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/models/campmodel.dart';
import 'package:travel_app/screens/camps/CampBookingPage.dart';
class CampDetails extends StatefulWidget {

  final CampModel campmodel;
  const CampDetails({Key key,this.campmodel}) : super(key: key);

  @override
  _CampDetailsState createState() => _CampDetailsState();
}

class _CampDetailsState extends State<CampDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          height: 800,
          width: 900,
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(

                child: CarouselSlider.builder(

                    itemCount: widget.campmodel.images.length,
                    itemBuilder:(BuildContext,int itemIndex,int pageViewIndex){
                      return Image.network(

                        widget.campmodel.images[itemIndex],fit: BoxFit.cover,width: 2000);
                    }, options: CarouselOptions(
                    height: 200
                )),
              ),
              SizedBox(
                height: 10,
              ),

              Text(widget
                  .campmodel.description.toString(),style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.normal),),
              Text(widget.campmodel.price.toString(),style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.normal)),
              Text(widget.campmodel.location.toString(),style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.normal))
              ,
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                child: GestureDetector(
                  onTap:
                      (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>CampBookingPage(campModel:widget.campmodel,description: widget.campmodel.description,price: widget.campmodel.price,)));
                  },


                  child: Column(
                    children: [Text(widget.campmodel.description.toString(),style: GoogleFonts.lato(fontStyle: FontStyle.italic,fontSize: 20,letterSpacing: 2,fontWeight: FontWeight.normal),),

                      ListTile(leading: Text('Day Outing with full back pack') ,trailing:Text('Zipping') ,),
                      ListTile(leading: Text('Mud Volley ball'),trailing: Text('Kayaking'),),
                      ListTile(leading: Text('Rafting'),trailing: Text('Sceneray') ,),
                      ListTile(leading: Text(widget.campmodel.price.toString()), trailing: IconButton(icon: Icon(Icons.add),color: Colors.red,iconSize: 30,onPressed: (){},),)

                    ],




                  ),
                ),
              )


            ],


          ),
        ),
      ),


    );
  }
}
