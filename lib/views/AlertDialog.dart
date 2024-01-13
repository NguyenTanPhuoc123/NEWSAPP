import 'package:doandidong/views/LoginScreen.dart';
import 'package:flutter/material.dart';

showDialogLogin(BuildContext context){
  showDialog(context: context,builder:(BuildContext context){
      var txt = TextEditingController();
      return AlertDialog(
        title: const Text('Đăng nhập',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
        content: const Text("Bạn có muốn đăng nhập?"),
        shape: const BeveledRectangleBorder(),
        actions: [
          TextButton(onPressed: ()=>Navigator.pop(context),
           child: const Text("Không")
          ),
          TextButton(onPressed:(){
            Navigator.push(context,MaterialPageRoute(builder: (context)=> const LoginScreen()));
          },
           child: const Text("Có")
          ),
        ],
      );
    });
}