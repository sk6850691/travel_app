import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_app/models/locationmodel.dart';

class LocationService{

  FirebaseFirestore firestore  = FirebaseFirestore.instance;
  String collection = "locations";


 Future<List<LocationModel>> getlocations()async{

    return await firestore.collection(collection).get().then((value) {

      List<LocationModel> locations = [];
      for(DocumentSnapshot location in value.docs ){
        locations.add(LocationModel.fromSnapshot(location));

      }
      return locations;


    });
  }

}