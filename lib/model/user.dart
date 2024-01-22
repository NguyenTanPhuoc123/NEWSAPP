import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  String uid;
  String email;
  String password;
  String displayName;
  String birthday;
  bool gender; //0:male,1:female
  User(this.uid,this.email,this.password,this.displayName,this.birthday,this.gender);
  
  User.fromJson(Map<dynamic,dynamic> json): uid = json['uid'],
                                            email = json['email'].toString(),
                                            password = json['password'].toString(),
                                            displayName = json['displayName']??"Username",
                                            birthday=json["birthday"].toString() ,
                                            gender = (json['gender']==1)?true:false;

  Map<String,dynamic> toJson()=>{
    "uid": uid,
    "email": email,
    "password": password,
    "displayName":displayName,
    "birthday":birthday,
    "gender":gender,
  };

  factory User.fromDocumentSnapshot(DocumentSnapshot snapshot){
    Map<String,dynamic> data = snapshot.data() as Map<String,dynamic>;
    return User(
      snapshot.id,
      data['email'].toString(),
      data['password'].toString(),
      data['displayName'] ?? "Username",
      data['birthday'].toString(),
      data['gender']==0?false:true
    );
  }

}