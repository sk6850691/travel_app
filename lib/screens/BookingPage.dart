import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:travel_app/models/bikemodel.dart';
import 'package:travel_app/providers/bikeprovider.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/screens/cartscreen.dart';
import 'package:travel_app/widgets/BikeWidget.dart';
class BookingPage extends StatefulWidget {
  const BookingPage({Key key}) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {

  DateTime _selectedDay;
  DateTime _focusedDay;
  int quantity = 0;
  int price;
  String  bikename;
  BikeModel model;
  @override
  Widget build(BuildContext context) {
    final bikeprovider = Provider.of<BikeProvider>(context);
    return Scaffold(
      body: ListView(
        children:[

          Container(
            height: 300,
            width: 200,

            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        price = bikeprovider.bikes[index].price;
                        bikename = bikeprovider.bikes[index].name;
                        model = bikeprovider.bikes[index];
                      });
                    },

                      child: BikeWidget(bikeModel: bikeprovider.bikes[index],));
                },
                separatorBuilder:   (BuildContext context, int index) => const SizedBox(width: 30,),
                itemCount: bikeprovider.bikes.length),
          ),



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
              _focusedDay = focusedDay; // update `_focusedDay` here as well
            });
          },
        ),
          Text(_selectedDay.toString()),
          SizedBox(
            height: 20,
          ),

         Row(
           children: [
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
             MaterialButton(
                 child:Text('BookNow'),
                 onPressed: (){
                   Navigator.push(context,MaterialPageRoute(builder: (context)=>CartScreen(date: _selectedDay.toString(),quantity: quantity,bikename: bikename,price: price,bikeModel: model,)));
                 })
           ],
          ),
      ]),


    );
  }
}
