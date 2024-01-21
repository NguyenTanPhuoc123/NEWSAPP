import 'package:doandidong/model/User.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key,required this.user});
  final User user;
  @override
  State<PersonalInformationScreen> createState() => _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  late String birthday;
  late String username;
  bool valueMale = false;
  bool valueFemale = false;

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
    DateTime birth = DateFormat("dd/MM/yyyy").parse(widget.user.birthday);
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
    setState(() {
      birthday = widget.user.birthday;
      username = widget.user.displayName;
      if(widget.user.gender){
        valueMale = true;
        valueFemale = false;
      }
      else{
        valueFemale = true;
        valueMale = false;
      }
    });
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
                      CircleAvatar(
                        backgroundImage: NetworkImage(widget.user.urlAvatar),
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
              Text(widget.user.email,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
              
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
