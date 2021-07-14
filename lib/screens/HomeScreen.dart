import 'dart:async';
import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travel_app/providers/LocationProvider.dart';
import 'package:travel_app/providers/userprovider.dart';
import 'package:travel_app/screens/Experiences.dart';
import 'package:travel_app/screens/RegistrationScreen.dart';
import 'package:travel_app/screens/homescreen1.dart';
import 'package:travel_app/widgets/locationwidget.dart';

import 'Profile.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  int _currentIndex = 0;
  PageController pageController;

  onTap(index){

    setState(() {
      pageController.animateToPage(index, duration: Duration(milliseconds: 10), curve: Curves.bounceOut);
    });

  }







  RoundedLoadingButtonController roundedLoadingButtonController = RoundedLoadingButtonController();

  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final locationProvider = Provider.of<LocationProvider>(context);
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          onTap(index);
        },
        items: [
          CustomNavigationBarItem(icon: Icon(Icons.home)),
          CustomNavigationBarItem(icon: Icon(Icons.search)),
          CustomNavigationBarItem(icon: Icon(Icons.shopping_bag)),
          CustomNavigationBarItem(icon: Icon(Icons.supervised_user_circle)),
        ],
      ),

      body:PageView(
        controller: pageController,

        onPageChanged: (index){
          setState(() {
            _currentIndex = index;
          });

        },
        children: [
        HomeScreen1(),
         MaterialButton(
             color:Colors.blue,onPressed: (){
           userProvider.googleSignOut();
         }),
          Text('page3'),
         Profile()
      ],)
        /* ListView(
        shrinkWrap: true,
        children: [
         Card(
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(10)
           ),


             
             child:Image.network(
             'https://firebasestorage.googleapis.com/v0/b/shine-of-coins-601fb.appspot.com/o/Hills-near-Chennai.jpg?alt=media&token=ebf63e79-0644-4f05-8918-fdaed1705fcb',
               fit: BoxFit.cover,
             )
           ),
          SizedBox(
            height: 10,
          ),
         Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
    const SizedBox(width: 10, height: 100.0),
    const Text(

    'DISCOVER',
    style: TextStyle(fontSize: 43.0,fontStyle: FontStyle.italic),
    ),
    const SizedBox(width: 20.0, height: 100.0),
    DefaultTextStyle(

    style: const TextStyle(
      color: Colors.black,
    fontSize: 40.0,
    fontFamily: 'Horizon',
    ),
    child: AnimatedTextKit(
    animatedTexts: [
    RotateAnimatedText('TREKS'),
    RotateAnimatedText('BIKES'),
    RotateAnimatedText('HOTELS'),
    ],
    onTap: () {
    print("Tap Event");
    },
    ),
    ),
    ],
         ),

          
          
          Container(
      height: 300,
            width: 100,

            child: GestureDetector(
              onTap:(){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>Experiences()));
              },

              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 20,),

                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                  itemCount: locationProvider.locations.length ,
                  itemBuilder: (context,index){
                    return LocationWidget(locationModel: locationProvider.locations[index],);
                  }),
            ),
          )
        ],
      )*/
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }
}
