import 'package:doandidong/model/Official.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doandidong/model/user.dart';

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

  static  getOfficialByName(String name){
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
    List<Official> list= List.filled(0,Official("","","","","","","","",List.empty(growable: true)),growable: true);
    for (var channel in officials) {
        for (var emailUser in channel.following) {
          if(emailUser.compareTo(email)==0){
            list.add(channel);
          }
        }
    }
    return list;
  }

  static Future<void> addUserForChannel(Official official, User user) async{
    official.following.add(user.email);
    await collection.doc(official.id).update({'following':official.following});
  
  }

  static Future<void> removeUserForChannel(Official official, User user) async{
    official.following.remove(user.email.toString());
    await collection.doc(official.id).update({'following':official.following});
  }

  static bool isFollowing(Official official,User user){
    for (String email in official.following) {
        if(user.email.compareTo(email)==0){
          return true;
        }
    }
    return false;
  }

}