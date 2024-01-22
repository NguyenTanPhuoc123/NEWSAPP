import 'package:doandidong/control/ControllerUserLogin.dart';
import 'package:doandidong/model/User.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() => _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  late String birthday=DateFormat("dd/MM/yyyy").format(DateTime.now()); 
  late String email="";
  late String username="";
  bool valueMale = true;
  bool valueFemale = false;
  late bool gender = valueMale;
   final ControllerUserLogin controller = ControllerUserLogin();
   Map<String, String>? localUserData;
     // hàm lấy thông tin user 
//    Future<void> _loadLocalUserData() async {
//   localUserData = await controller.getLocalUserData();
//   if (localUserData != null) {
//     setState(() {
//       email = localUserData!['email'] ?? '';
//       username = localUserData!['displayName'] ?? '';
//       birthday = localUserData!['birthday'] ?? DateFormat("dd/MM/yyyy").format(DateTime.now());
//       valueMale = localUserData!['gender'] == true;
//       valueFemale = localUserData!['gender'] == false;
//     });
//   } else {
//     // Nếu không có dữ liệu local, giữ nguyên dữ liệu mặc định
//     setState(() {
//     });
//   }
// }
Future<void> _loadUserDataFromFirestore() async {
  final userController = ControllerUserLogin();
  final user = await userController.getUserInfo();

  if (user != null) {
    final userData = await userController.getUserInfoFromFirestore(user.uid);
    if (userData != null) {
      setState(() {
        email = userData['email'] ?? '';
        username = userData['displayName'] ?? '';
        birthday = userData['birthday'] ?? DateFormat("dd/MM/yyyy").format(DateTime.now());
      });
    } else {
      // Handle case where user data is not available
      print('Không thể lấy thông tin người dùng từ Firestore');
    }
  } else {
    // Handle case where user is not authenticated
    print('Người dùng chưa đăng nhập');
    // You might want to redirect to the login screen
  }
}
  editDisplayname(){
    showDialog(context: context,builder:(BuildContext context){
      var txt = TextEditingController();
      return AlertDialog(
        title: const Text('Cập nhật'),
        content: TextField(
          controller: txt,
        ),
        shape: const BeveledRectangleBorder(),
        actions: [
          TextButton(onPressed: ()=>Navigator.pop(context),
           child: const Text("Không")
          ),
          TextButton(onPressed:(){
            setState(() {
              if(txt.text.isNotEmpty){
                username = txt.text;
              }
              Navigator.pop(context);
            });
          },
           child: const Text("Có")
          ),
        ],
      );
    });
    
  }

  editBirthday(){
    DateTime birth = DateFormat("dd/MM/yyyy").parse(birthday);
    showDatePicker(
      context: context,
      initialDate: birth,
      firstDate: DateTime(1900),
      lastDate: DateTime(2050),
    ).then((DateTime? value){
      setState(() {
        birthday =  DateFormat("dd/MM/yy").format(value??birth);
      });
    });
  }




  @override
void initState() {
  super.initState();
  _loadUserDataFromFirestore();
    if (birthday.isEmpty) {
    // đặt ngày sinh mặc định
    birthday = DateFormat("dd/MM/yyyy").format(DateTime.now());
  }

  if (!valueMale && !valueFemale) {
    // đặt giới tính mặc định
    valueMale = true; 
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
        icon: const Icon(Icons.arrow_back,color: Colors.black38,),
        onPressed: () {
          Navigator.pop(context);
        },
      )),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(height: 50),
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://photo-baomoi.bmcdn.me/w700_r1/2024_01_11_294_48049895/f54db0fedab233ec6aa3.jpg"),
                        radius: 70,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(25)
                          ),
                          child: IconButton(
                            onPressed: () {
                              // Sự kiện thêm hình ảnh
                            },
                            icon: const Icon(Icons.camera_alt_rounded,),color: Colors.grey,
                            iconSize: 20,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("Tên hiển thị",style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18
              ),),
               Text(username,style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18
              ),),
              IconButton(onPressed: editDisplayname, icon: const Icon(Icons.edit))
            ],  
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("Giới tính",style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18
              ),),
              Row(
                children: [
                  Radio(
                    value: valueMale,
                    groupValue: true,
                    onChanged: (value){
                      setState(() {
                        valueMale = true;
                        valueFemale = false;
                      });
                    }
                  ),
                  const SizedBox(width: 5),
                  const Text("Nam",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),)
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: valueFemale,
                    groupValue: true,
                    onChanged: (value){
                      setState(() {
                        valueFemale = true;
                        valueMale = false;
                      });
                    }
                  ),
                  const SizedBox(width: 5),
                  const Text("Nữ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),)
                ],
              )
              
              
            ]
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("Ngày sinh",style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18
              ),),
              Text(birthday,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
              IconButton(onPressed:editBirthday, icon: const Icon(Icons.calendar_month))
            ],
          ),
          const SizedBox(height: 15),            
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("Email",style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18
              ),),
              Text(email,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
              
            ],
          ),
          const SizedBox(height: 80),
          ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[400],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
            ),
            child:  Container(
              alignment: Alignment.center,
              width: 100,
              height: 50,
              child:const  Text("Cập nhật",style: TextStyle(
                fontSize: 20,
                color: Colors.white
              ),),
            )
          )
        ],
      )),
    );
  }
}
