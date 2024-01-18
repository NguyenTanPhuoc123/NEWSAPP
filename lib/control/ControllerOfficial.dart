import 'package:doandidong/model/Official.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ControllerOfficial{
  static List<Official> officials = List.filled(0,Official("","","","","","","",""),growable: true);
  static CollectionReference collection = FirebaseFirestore.instance.collection('officials');
  
  static Future<void> getListOfficial() async{
    officials.clear();
    QuerySnapshot querySnapshot = await collection.get();
    for (DocumentSnapshot snapshot in querySnapshot.docs) {
      officials.add(Official.fromDocumentSnapshot(snapshot));
    }
  }

  static getOfficialByName(String name){
    try{
    for (var official in officials) {
      if(official.name.compareTo(name)==0){
        return official;
      }
    }
    }catch(e){
      print(e);
      return null;
    }
    return null; 
  }

}