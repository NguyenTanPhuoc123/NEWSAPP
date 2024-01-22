import 'package:doandidong/control/ControllerOfficial.dart';
import 'package:doandidong/model/Official.dart';
import 'package:doandidong/views/officialScreen.dart';
import 'package:flutter/material.dart';

class FollowScreen extends StatefulWidget {
  const FollowScreen({super.key});

  @override
  State<FollowScreen> createState() => _FollowScreenState();
}

class _FollowScreenState extends State<FollowScreen> {
  List<Official> officials = List.filled(0,Official("","","","","","","","",[]),growable: true);
  @override
  void initState() {
    super.initState();
    setState(() {
      officials = ControllerOfficial.getListOfficialByUser("danhkbm12@gmail.com");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đang theo dõi',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
        centerTitle: true,
        leading: IconButton(
          onPressed: ()=>Navigator.pop(context),
          icon: const Icon(Icons.arrow_back,color: Colors.black38,)
        ),
        
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: officials.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>OfficialScreen(official: officials[index]))),
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: 100,
                height: 100,
                alignment: Alignment.center,
                color: Colors.grey[200],
                child: Row(         
                children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(officials[index].urlLogo),
                          fit: BoxFit.fill)),
                ),
                const SizedBox(width: 5,),
                Text(
                  officials[index].name,
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 18),
                ),
                const Expanded(
                  child: Icon(Icons.done_all),
                )
              ])),
            );
          }),
    );
  }
}

