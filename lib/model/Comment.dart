import 'package:doandidong/model/user.dart';

class Comment{
  User user;
  String time;
  String content;
  Comment(this.user, this.time, this.content);
}