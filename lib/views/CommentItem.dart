import 'package:doandidong/model/comment.dart';
import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({super.key,required this.comment});
  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(comment.user.displayName,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
              Text(comment.time,style:TextStyle(fontSize: 12,fontWeight: FontWeight.w300))
            ],
          ),
          subtitle: Text(comment.content,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
          leading: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage("https://anvientv.com.vn/uploads/upload/1675741738_hinh-chu-tieu(3).jpg"),fit: BoxFit.fill),
              shape: BoxShape.circle
            ),
              
          ),
        ),
        const Divider(color: Colors.black26,)
      ],
    );
  }
}