import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:travel_app/models/bikemodel.dart';
import 'package:travel_app/providers/userprovider.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/screens/scootydetails.dart';
import 'package:travel_app/services/orders.dart';
class CartScreen extends StatefulWidget {
  final String date;
  final String guests;
  final String bikename;
  final int price;
  final int quantity;
  final BikeModel bikeModel;
  

  const CartScreen({Key key,this.date,this.guests,this.bikename,this.price,this.quantity,this.bikeModel}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  OrderService service = OrderService();
  Razorpay _razorpay;
  UserProvider provider = UserProvider.intialize();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_live_yuPK8L6sbL0LTk',
      'amount': 200,
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
     service.createOrder(cart: provider.cartitem);

     Navigator.pop(context,MaterialPageRoute(builder: (context)=>ScootyDetails()));
   }



  }
  _handlePaymentError(){


  }



  @override
  Widget build(BuildContext context) {

    final userProvider  = Provider.of<UserProvider>(context);


    return Scaffold(

     body: ListView(
       children: [
         Text(widget.date),
         Text(widget.guests.toString()),
         Text(widget.bikename),
         Text(widget.price.toString()),
         MaterialButton(
             child: Text('add to cart'),
             onPressed:(){

           userProvider.addToCart(bikeModel:widget.bikeModel ,quantity: widget.quantity);
         } ),
         
         
         SizedBox(height: 30,),
         

         
         MaterialButton(
             child: Text('place order'),

             onPressed: (){
             openCheckout();
    }
    )




       ],
    )
    );
  }
}
