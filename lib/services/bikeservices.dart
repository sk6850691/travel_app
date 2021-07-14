import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_app/models/bikemodel.dart';

class BikeService{

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String collections = "bikes";


  getBikes(){
    return firestore.collection(collections).get().then((value) {
      List<BikeModel> bikes = [];
      for(DocumentSnapshot snapshot in  value.docs){
        bikes.add(BikeModel.fromSnapshot(snapshot));
      }
      return bikes;
    });

  }

}