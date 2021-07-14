import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/models/trekkingmodel.dart';
import 'package:travel_app/providers/trekkingprovider.dart';
import 'package:travel_app/screens/AdventureBookingPage.dart';
import 'package:travel_app/screens/BookingPage.dart';
import 'package:travel_app/widgets/adventurewidget.dart';
import 'package:provider/provider.dart';
class AdventureScreen extends StatefulWidget {
  final trek;
  const AdventureScreen({Key key,this.trek}) : super(key: key);

  @override
  _AdventureScreenState createState() => _AdventureScreenState();
}

class _AdventureScreenState extends State<AdventureScreen> {
  @override
  Widget build(BuildContext context) {
    final trekkingProvider = Provider.of<TrekingProvider>(context);
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

                    itemCount: widget.trek.image.length,
                    itemBuilder:(BuildContext,int itemIndex,int pageViewIndex){
                      return Image.network(

                        widget.trek.image[itemIndex],fit: BoxFit.cover,width: 1800,);
                    }, options: CarouselOptions(
                  height: 200
                )),
              ),
              SizedBox(
                height: 10,
              ),

              Text(widget
                  .trek.description.toString(),style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.normal),),
              Text(widget.trek.price.toString(),style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.normal)),
              Text(widget.trek.location.toString(),style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.normal))
           ,
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: GestureDetector(
                  onTap: 
                  (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>AdventureBookingPage(trekkingModel:widget.trek,description: widget.trek.description,price: widget.trek.price,)));
                  },
                  
                 
                  child: Column(
                    children: [Text(widget.trek.description.toString(),style: GoogleFonts.lato(fontStyle: FontStyle.italic,fontSize: 20,letterSpacing: 2,fontWeight: FontWeight.normal),),

                      ListTile(leading: Text('Day Outing with full back pack') ,trailing:Text('Zipping') ,),
                      ListTile(leading: Text('Mud Volley ball'),trailing: Text('Kayaking'),),
                      ListTile(leading: Text('Rafting'),trailing: Text('Sceneray') ,),
                      ListTile(leading: Text(widget.trek.price.toString()), trailing: IconButton(icon: Icon(Icons.add),color: Colors.red,iconSize: 30,onPressed: (){},),)

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
