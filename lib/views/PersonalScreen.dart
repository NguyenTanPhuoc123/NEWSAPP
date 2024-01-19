
import 'package:doandidong/control/ControlUser.dart';
import 'package:doandidong/views/AlertDialog.dart';
import 'package:doandidong/control/ControllerUserLogin.dart';
import 'package:doandidong/views/CollectionScreen.dart';
import 'package:doandidong/views/FavoriteScreen.dart';
import 'package:doandidong/views/ForgotPasswordScreen.dart';
import 'package:doandidong/views/HistoryScreen.dart';
import 'package:doandidong/views/LoginScreen.dart';
import 'package:doandidong/views/PersonalInformationScreen.dart';
import 'package:doandidong/views/followScreen.dart';
import 'package:doandidong/views/inputnewpasswordscreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PersonalScreen extends StatefulWidget {
  const PersonalScreen({super.key});
  
  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {


 final ControllerUserLogin controller = ControllerUserLogin();
  item(IconData icon, String label,Widget page){

    return InkWell(
      onTap: (){
        if(ControllerUser.isLogin){
        Navigator.push(context, MaterialPageRoute(builder:(context)=>page));
        }
        else{
          showDialogLogin(context);
        }
      } ,
      child: Column(
        children: [
          Icon(icon),
          Text(label,style:const TextStyle(fontSize: 18),)
        ],
      ),
    );
  }

  statistical(IconData icon,String label,int count){
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Icon(icon),
          Text(label,style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500
          ),),
          Text(formatCount(count))
        ],
      ),
    );
  }

  String formatCount(int number){
    if(number<10000)
    {
      return "$number";
    }
    else if(number>=10000 && number<1000000)
    {
      return "${number~/1000}K+";
    }
    else if(number<1000000000)
    {
      return "${number~/1000000}M+";
    }
    else {
      return "1T+";
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CÁ NHÂN",style: TextStyle(
          color: Color.fromRGBO(75, 177, 73, 1),
          fontSize: 24,
          fontWeight: FontWeight.w600
        ),),
        actions: [
          IconButton(onPressed: (){
            if(ControllerUser.isLogin){
              showDialogLogout(context);
            }
            else{
              showDialogLogin(context);
            }

             controller.logout(context);

          },
          icon: const Icon(Icons.exit_to_app,color: Colors.black38,)
        )
        ],
      ),
      body: Column(
        children: [
         Container(
          color: Colors.grey[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(backgroundImage: NetworkImage("https://anvientv.com.vn/uploads/upload/1675741738_hinh-chu-tieu(3).jpg"),radius: 45),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Username",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                      InkWell(
                        onTap: (){
                          if(ControllerUser.isLogin){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>const PersonalInformationScreen()));
                          }
                          else{
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>const LoginScreen()));
                          }
                        },
                        child:  Text(ControllerUser.isLogin? "Xem thông tin cá nhân":"Đăng nhập",style: TextStyle(
                          color: Colors.green[500],
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                        ),),
                      ),
                      
                    ],
                  ),
                ],
              ),
            Container(            
              margin: const EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  item(Icons.folder,"Bộ sưu tập",const CollectionScreen()),
                  item(FontAwesomeIcons.solidHeart,"Bài đã thích",const FavoriteScreen()), 
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  item(Icons.history,"Lịch sử đọc",const HistoryScreen()),
                  item(Icons.list_alt,"Đang theo dõi",const FollowScreen()), 
                ],
              ),
            ),
            
            ],
           
          ),
         ),
        Container(
              margin: const EdgeInsets.only(top: 40),
              color: Colors.grey[200],
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 10,),
                      Text("Thống kê của bạn",style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600
                      ),)
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      statistical(FontAwesomeIcons.newspaper,"Khám phá",11000),
                      statistical(FontAwesomeIcons.heart,"Lượt thích",11000),
                      statistical(Icons.list_alt,"Theo dõi",11000),
                    ],
                  ),
                   const SizedBox(height: 32,)
                ],
               
              ),
            ),
            const SizedBox(height: 50),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[200],
            child: MaterialButton(
            onPressed: (){
              if(ControllerUser.isLogin){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>const ForgotPasswordScreen()));
              }
              else{
                showDialogLogin(context);
              }
            },            
            child:  const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Đổi mật khẩu",style: TextStyle(
                  fontSize: 18,fontWeight: FontWeight.w500
                ),),
                Icon(Icons.arrow_forward_ios,color: Colors.black38,)
              ],
            ),
            ),
          )
        ]
      ),
    );
  }
}