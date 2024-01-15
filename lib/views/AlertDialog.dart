import 'package:doandidong/views/LoginScreen.dart';
import 'package:flutter/material.dart';

showDialogLogin(BuildContext context){
  showDialog(context: context,builder:(BuildContext context){
      return AlertDialog(
        title: const Text('Đăng nhập',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
        content: const Text("Bạn có muốn đăng nhập?"),
        shape: const BeveledRectangleBorder(),
        actions: [
          TextButton(onPressed: ()=>Navigator.pop(context),
           child: const Text("Không")
          ),
          TextButton(onPressed:(){
            Navigator.pop(context);
            Navigator.push(context,MaterialPageRoute(builder: (context)=> const LoginScreen()));
          },
           child: const Text("Có")
          ),
        ],
      );
    });
}

showDialogLogout(BuildContext context){
  showDialog(context: context,builder:(BuildContext context){
      return AlertDialog(
        title: const Text('Đăng xuất',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
        content: const Text("Bạn chắc chắc muốn đăng xuất khỏi ứng dụng?"),
        shape: const BeveledRectangleBorder(),
        actions: [
          TextButton(onPressed: ()=>Navigator.pop(context),
           child: const Text("Không")
          ),
          TextButton(onPressed:(){
            Navigator.pop(context);
            Navigator.push(context,MaterialPageRoute(builder: (context)=> const LoginScreen()));
          },
           child: const Text("Có")
          ),
        ],
      );
    });
}