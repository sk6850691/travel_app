import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/models/trekkingmodel.dart';
import 'package:carousel_slider/carousel_slider.dart';
class Trekkingwidget extends StatefulWidget {
  final TrekkingModel trekkingModel;
  const Trekkingwidget({Key key,this.trekkingModel}) : super(key: key);

  @override
  _TrekkingwidgetState createState() => _TrekkingwidgetState();
}

class _TrekkingwidgetState extends State<Trekkingwidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children:


      [



 CarouselSlider.builder(
              itemCount: widget.trekkingModel.image.length,

              itemBuilder:(BuildContext,int itemIndex,int pageViewIndex){
                return ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(

                      widget.trekkingModel.image[itemIndex],fit: BoxFit.cover,width: 1800,),
                );
              }
            //  widget.trekkingModel.image.map((e) => Image.network(e.toString(),



              ,
              options: CarouselOptions(
                enlargeCenterPage: true,
                autoPlay: true,

          )),


        Text(widget
        .trekkingModel.description.toString(),style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.normal),),
        Text(widget.trekkingModel.price.toString(),style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.normal)),
        Text(widget.trekkingModel.location.toString(),style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.normal))
    ]);
  }
}
