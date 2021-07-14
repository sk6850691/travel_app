import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/screens/Experiences.dart';
import 'package:travel_app/screens/scootydetails.dart';
import 'package:travel_app/screens/uniquestays.dart';
class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({Key key}) : super(key: key);

  @override
  _HomeScreen1State createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(


              child: Image.network(

                  'https://firebasestorage.googleapis.com/v0/b/shine-of-coins-601fb.appspot.com/o/Hills-near-Chennai.jpg?alt=media&token=ebf63e79-0644-4f05-8918-fdaed1705fcb',fit: BoxFit.fill,)
              ,

            ),
            SizedBox(
              height: 20,
            ),
            Text('What would you like to do ?',style: GoogleFonts.lato(fontSize: 30,fontStyle: FontStyle.italic),),
            SizedBox(
              height: 10,
            ),
           SingleChildScrollView(
             scrollDirection: Axis.horizontal ,
             child: Container(
               height: 800,
               child: Row(

                 children: [
                   Container(
                     height: 600,
                     width: 200,
                     child: GestureDetector(
                       onTap: (){
                         Navigator.push(context,MaterialPageRoute(builder: (context)=>UniqueStays()));
                       },
                       child: Stack(
                         children: [
                           ClipRRect(
                       child:
                           Image.network('https://firebasestorage.googleapis.com/v0/b/shine-of-coins-601fb.appspot.com/o/45410804291_1993248528_b_20190810152300.jpg?alt=media&token=0cc675a6-bd6b-426e-9fc5-d7bbef50f072',height: 400,fit: BoxFit.fitHeight,),
                             borderRadius: BorderRadius.circular(20),
                           ),
                         Padding(
                             padding: EdgeInsets.only(top: 30,left: 30),

                             child: Text('Unique Stays',style:  GoogleFonts.caveat(color:Colors.white,fontStyle: FontStyle.italic,fontSize: 50,fontWeight: FontWeight.normal),))],
                       ),
                     ),
                   ),
                   SizedBox(
                     width: 10,
                   ),
                   Container(
                     height: 600,
                     width: 200,
                     child: GestureDetector(
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>Experiences()));
                       },
                       child: Stack(
                         children: [
                           ClipRRect(
                             child: Image.network('https://images.unsplash.com/photo-1568454537842-d933259bb258?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',height: 400,fit: BoxFit.fitHeight,),

                           borderRadius: BorderRadius.circular(20),),
                           Padding(
                               padding: EdgeInsets.only(top: 30,left: 30),
                               child: Text('Experiences',style: GoogleFonts.lato(fontStyle: FontStyle.italic,fontSize: 20,fontWeight: FontWeight.normal),))
                         ],
                       ),
                     ),
                   ),
                   SizedBox(
                     width: 10,
                   ),
                   Container(
                     height: 600,
                     width: 200,
                     child: Stack(
                       children: [
                         ClipRRect(
                             
                             child: Image.network('https://images.unsplash.com/photo-1542983013-727fa3280ab0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=334&q=80',height: 400,fit: BoxFit.fitHeight,),
                         borderRadius: BorderRadius.circular(20),),
                         Text('Experiences')
                       ],
                     ),
                   ),
                   SizedBox(
                     width: 10,
                   ),
                   Container(
                     height: 600,
                     width: 200,
                     child: Stack(
                       children: [
                         ClipRRect(


                             child: Image.network('https://images.unsplash.com/photo-1526772662000-3f88f10405ff?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80',height: 400,fit: BoxFit.fitHeight,)
                         ,borderRadius: BorderRadius.circular(20),
                         ),
                         Padding(
                             padding: EdgeInsets.only(top: 30,left: 30),
                             child: Text('Trekking',style:  GoogleFonts.caveat(fontStyle: FontStyle.italic,fontSize: 20,fontWeight: FontWeight.normal),))
                       ],
                     ),
                   )

                 ],
               ),
             ),
           )


            
          ],
        ),
      ),
    );
  }
}
