import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:travel_app/models/campmodel.dart';
import 'package:travel_app/providers/userprovider.dart';
import 'package:travel_app/screens/camps/CampCartScreen.dart';
class CampBookingPage extends StatefulWidget {

  final String description;
  final String price;
  final CampModel campModel;
  const CampBookingPage({Key key,this.price,this.campModel,this.description}) : super(key: key);

  @override
  _CampBookingPageState createState() => _CampBookingPageState();
}

class _CampBookingPageState extends State<CampBookingPage> {
  int quantity = 0;
  DateTime _selectedDay;

  @override
  Widget build(BuildContext context) {

    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Column(
                children:[
                  SizedBox(height: 20,),

                  Text(widget.description),
                  SizedBox(height: 20,),

                  TableCalendar(
                    firstDay: DateTime.utc(2021,01,01),
                    lastDay: DateTime.utc(2021,12,12),
                    focusedDay: DateTime.now(),
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        // update `_focusedDay` here as well
                      });
                    },
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Row(children:[

                    Text('No. of people'),
                    SizedBox(
                      width: 80,
                    ),
                    IconButton(onPressed: (){
                      if(quantity>0){
                        setState(() {
                          quantity = quantity-1;
                        });
                      }
                    }, icon: Icon(Icons.remove)),
                    Text(quantity.toString()),
                    IconButton(onPressed: (){
                      setState(() {
                        quantity +=1;
                      });
                    }, icon: Icon(Icons.add)),

                  ]),
                  SizedBox(height: 50,),

                  FlatButton(
                      minWidth: 300,
                      color: Colors.redAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child:Text('AddToCart'),
                      onPressed: (){
                     userProvider.addCampToCart(campModel: widget.campModel,quantity: quantity.toString());
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>CampCartScreen()));
                      }),


                ]))
    );;
  }
}
