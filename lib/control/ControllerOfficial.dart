import 'package:doandidong/model/Official.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doandidong/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ControllerOfficial{
  static List<Official> officials = List.filled(0,Official("","","","","","","","",[]),growable: true);
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

  static List<Official> getListOfficialByUser(String email){
    List<Official> list= List.filled(0,Official("","","","","","","","",[]),growable: true);
    for (var channel in officials) {
        for (var emailUser in channel.following) {
          if(emailUser.compareTo(email)==0){
            list.add(channel);
          }
        }
    }
    return list;
  }

  static addUserForChannel(Official official){
    FirebaseAuth auth = FirebaseAuth.instance;
    print(auth.currentUser!.email.toString());
    official.following.add(auth.currentUser!.email.toString());
  }

  static removeUserForChannel(Official official){
    FirebaseAuth auth = FirebaseAuth.instance;
    print(auth.currentUser!.email.toString());
    official.following.remove(auth.currentUser!.email.toString());
  }

  static bool isFollowing(Official official){
    FirebaseAuth auth = FirebaseAuth.instance;
    for (String email in official.following) {
        if(auth.currentUser!.email!.compareTo(email)==0){
          return true;
        }
    }
    return false;
  }

}