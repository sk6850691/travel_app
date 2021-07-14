import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/models/trekkingmodel.dart';
class AdventureWidget extends StatelessWidget {
  final TrekkingModel trekkingModel;
  const AdventureWidget({Key key,this.trekkingModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: 300,

          child: CarouselSlider.builder(
              itemCount: trekkingModel.image.length,

              itemBuilder:(BuildContext,int itemIndex,int pageViewIndex){
                return Image.network(trekkingModel.image[itemIndex],fit: BoxFit.cover,width: 1800,);
              }
              //  widget.trekkingModel.image.map((e) => Image.network(e.toString(),



              ,
              options: CarouselOptions(
                enlargeCenterPage: true,
                autoPlay: true,

              )),
        ),
      ],
    );
  }
}
