
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:travel_app/services/orders.dart';
class CampCartScreen extends StatefulWidget {

  final String description;


  final String price;
  final String guests;
  final DateTime dateTime;
  final camp;

  const CampCartScreen({Key key,this.description,this.price,this.guests,this.dateTime,this.camp}) : super(key: key);

  @override
  _CampCartScreenState createState() => _CampCartScreenState();
}

class _CampCartScreenState extends State<CampCartScreen> {
  Razorpay _razorpay;
  String Price = '';
  OrderService service = OrderService();
  String textfield = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    Price = widget.price;




  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_live_yuPK8L6sbL0LTk',
      'amount': Price.toString(),
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };


    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  _handlePaymentSuccess(PaymentSuccessResponse response){
    if(response!=null){
      //service.createOrder(cart: provider.cartitem);

      //Navigator.pop(context,MaterialPageRoute(builder: (context)=>ScootyDetails()));
    }



  }
  _handlePaymentError(){


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),

        body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(

                  padding:EdgeInsets.only(top: 20,left: 100) ,
                  child:Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Text(widget.description.toString(),style: GoogleFonts.lato(fontSize: 20,fontStyle: FontStyle.normal,fontWeight: FontWeight.normal),),
                        Text(Price.toString(),style: GoogleFonts.lato(fontSize: 20,fontStyle: FontStyle.normal,fontWeight: FontWeight.normal),),
                        // Text(Price.toString(),style: GoogleFonts.lato(fontSize: 20,fontStyle: FontStyle.normal,fontWeight: FontWeight.normal),),
                        Text(widget.dateTime.toString().substring(0,10),style: GoogleFonts.lato(fontSize: 20,fontStyle: FontStyle.normal,fontWeight: FontWeight.normal),)
                      ]),


                ),

                SizedBox(height: 40,),

                Card(
                  child: Column(
                    children: [
                      Text('Guest Details', style: GoogleFonts.lato(fontStyle: FontStyle.normal,fontWeight: FontWeight.normal,fontSize: 30)
                        ,),

                      Row(
                        children: [
                          ClipRRect(),
                          Padding(
                            padding: EdgeInsets.only(left: 100),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(' shubh karan', style: GoogleFonts.lato(fontStyle: FontStyle.normal,fontWeight: FontWeight.normal,fontSize: 20)),
                                Text('shubhkaran828@gmail.com', style: GoogleFonts.lato(fontStyle: FontStyle.normal,fontWeight: FontWeight.normal,fontSize: 20)),
                                Text('+917527910117', style: GoogleFonts.lato(fontStyle: FontStyle.normal,fontWeight: FontWeight.normal,fontSize: 20))

                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),




                SizedBox(height:30),
                TextField(
                  onChanged: (value){
                    setState(() {
                      textfield = value;

                    });
                  },

                  decoration: InputDecoration(
                      hintText: 'Enter Coupon'
                  ),

                 // controller: couponController,



                ),
                IconButton(onPressed: (){
                  if(textfield == 'GRAMYATRI'){
                    setState(() {
                      Price = '100';
                    });
                  }
                  else{
                    Price = widget.price;
                  }


                }, icon: Icon(Icons.local_offer_rounded))
                ,



                FlatButton(
                    color: Colors.redAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    minWidth: 400,
                    child: Text('place order'),

                    onPressed: (){
                      openCheckout();
                    }
                )




              ],)
        )
    );;
  }
}
