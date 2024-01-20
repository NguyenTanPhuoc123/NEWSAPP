import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  int id;
  String name;
  List<String> url;
  Category(this.id,this.name,this.url);
  factory Category.fromDocumentSnapshot(DocumentSnapshot snapshot){
    Map<String,dynamic> data = snapshot.data() as Map<String,dynamic>;
    return Category(
      int.parse(data['id'].toString()),
      data['name'].toString(),
      data['url'] as List<String>,
    );
  }
}