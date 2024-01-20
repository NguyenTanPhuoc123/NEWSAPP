import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doandidong/model/Category.dart';


class ControllerCategory{
  static List<Category> categories = [
    Category(1,
    "Nổi bật",
    ["https://vnexpress.net/rss/tin-noi-bat.rss","https://vtc.vn/rss/feed.rss"]),
    Category(2,"Mới nhất",["https://vnexpress.net/rss/tin-moi-nhat.rss","https://vtc.vn/rss/feed.rss"]),
    Category(3,"Thể thao",["https://vnexpress.net/rss/the-thao.rss","https://vtc.vn/rss/the-thao.rss"]),
    Category(4,"Thời sự",["https://vnexpress.net/rss/thoi-su.rss","https://vtc.vn/rss/thoi-su.rss"]),
    Category(5,"Giải trí",["https://vnexpress.net/rss/giai-tri.rss","https://vtc.vn/rss/van-hoa-giai-tri.rss"])
  ];
  static CollectionReference category = FirebaseFirestore.instance.collection('Category');
  static Future<void> getListCategory() async{
    categories.clear();
    QuerySnapshot querySnapshot = await category.get();
    for (DocumentSnapshot snapshot in querySnapshot.docs) {
      categories.add(Category.fromDocumentSnapshot(snapshot));
    }
  }


}