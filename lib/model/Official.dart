import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
class Official{
  String id;
  String urlLogo;
  String name;
  String address;
  String email;
  String phone;
  String website;
  String description;
  List<dynamic> following;
  Official(this.id,this.urlLogo,this.name,this.description,this.address,this.email,this.phone,this.website,this.following);
  factory Official.fromDocumentSnapshot(DocumentSnapshot snapshot){
    Map<String,dynamic> data = snapshot.data() as Map<String,dynamic>;
    return Official(
      data['id'].toString(),
      data['urlLogo'].toString(),
      data['name'].toString(),
      data['description'].toString(),
      data['address'].toString(),
      data['email'].toString(),
      data['phone'].toString(),
      data['website'].toString(),
      data['following'] as List<dynamic>
    );
  }
}