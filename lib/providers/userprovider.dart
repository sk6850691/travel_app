import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:travel_app/models/bikemodel.dart';
import 'package:travel_app/models/campmodel.dart';
import 'package:travel_app/models/cartItemmodel.dart';
import 'package:travel_app/models/trekkingmodel.dart';
import 'package:travel_app/models/usermodel.dart';
import 'package:travel_app/services/orders.dart';
import 'package:travel_app/services/userservices.dart';
import 'package:uuid/uuid.dart';

enum Status{Uninitialized,Authenticated,Unauthenticated,Authenticating}

class UserProvider extends ChangeNotifier{

  FirebaseAuth auth = FirebaseAuth.instance;
  Status _status = Status.Uninitialized;
  User user;

  UserModel _userModel;
  get userModel => _userModel;
  UserService service = UserService();
  OrderService orderService = OrderService();

  String cartItemId = Uuid().v4();

  Map cartitem;
  TextEditingController couponcontroller = TextEditingController();





  onAuthStateChanged(User user){

    if(user==null){
      status = Status.Unauthenticated;
      notifyListeners();
    }else{
      user = user;
      status = Status.Authenticated;
      notifyListeners();
    }


  }


  Future<UserCredential> signInWithGoogle()async{
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,

    );

    return await auth.signInWithCredential(credential).then((value) {
      user = value.user;
     FirebaseFirestore.instance.collection('users').doc(value.user.uid).set({
        "id":value.user.uid,
        "name":value.user.displayName,
        "email":value.user.email


      });
    });

  }



  Status status = Status.Uninitialized;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller= TextEditingController();

  TextEditingController phoneController = TextEditingController();


  UserProvider.intialize():auth = FirebaseAuth.instance{
    auth.authStateChanges().listen(onAuthStateChanged);
  }


  phonesignIn(){

    auth.verifyPhoneNumber(
        phoneNumber: phoneController.text,
        verificationCompleted:(PhoneAuthCredential credential)async{

          await auth.signInWithCredential(credential);

        },
        verificationFailed: (FirebaseAuthException e){
          if(e.code == 'invalid-phone-number'){
            print('The provided phone number is not valid');
          }

        },
        codeSent: (String verificationId, int resendToken){

        },
    //    codeAutoRetrievalTimeout: codeAutoRetrievalTimeout
    );
  }

  googleSignOut(){
    auth.signOut();




  }
  signin(){



  }

  signUp(){
    auth.signInWithPhoneNumber(phoneController.text,RecaptchaVerifier(

      container: 'rewcaptcha',
      size: RecaptchaVerifierSize.compact,
      theme: RecaptchaVerifierTheme.dark
    ));


  }




  addToCart({BikeModel bikeModel, int quantity})async{



  cartitem = {

      "id":cartItemId,
      "name": bikeModel.name,
      "price": bikeModel.price,
      "quantity": bikeModel.quantity
    };


    await service.addToCart(userId:user.uid,cartitem: cartitem );




  }

  addAdventureToCart({TrekkingModel trekkingModel,String quantity}){

    cartitem = {


      "quantity": quantity.toString(),
      "price": trekkingModel.price,
      "location": trekkingModel.price,
      "id": cartItemId
    };
    service.addToCart(userId: user.uid,cartitem: cartitem);
    }

    addCampToCart({CampModel campModel,String quantity}){

    cartitem = {

      "quantity": quantity.toString(),
      "price": campModel.price,
      "location": campModel.location,
      "id": cartItemId
    };

    service.addToCart(userId: user.uid,cartitem:cartitem );

    }


  }









