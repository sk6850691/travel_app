import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/models/campmodel.dart';
import 'package:travel_app/models/trekkingmodel.dart';
import 'package:carousel_slider/carousel_slider.dart';
class CampWidget extends StatefulWidget {
  final CampModel campModel;
  const CampWidget({Key key,this.campModel}) : super(key: key);

  @override
  _CampWidgetState createState() => _CampWidgetState();
}

class _CampWidgetState extends State<CampWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      child: Column(

          children:


          [



            Container(

              child: CarouselSlider.builder(

                  itemCount: widget.campModel.images.length,

                  itemBuilder:(BuildContext,int itemIndex,int pageViewIndex){
                    return ClipRRect(

                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(


                        widget.campModel.images[itemIndex],fit: BoxFit.cover,width: MediaQuery.of(context).size.width,),
                    );
                  }
                  //  widget.trekkingModel.image.map((e) => Image.network(e.toString(),



                  ,
                  options: CarouselOptions(

                    enlargeCenterPage: true,
                    autoPlay: true,

                  )),
            ),


            Text(widget
                .campModel.description.toString(),style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.normal),),
            Text(widget.campModel.price.toString(),style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.normal)),
            Text(widget.campModel.location.toString(),style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.normal))
          ]),
    );
  }
}
