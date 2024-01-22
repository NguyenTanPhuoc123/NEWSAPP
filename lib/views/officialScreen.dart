import 'package:doandidong/control/ControllerNews.dart';
import 'package:doandidong/control/ControllerOfficial.dart';
import 'package:doandidong/control/ControllerUserLogin.dart';
import 'package:doandidong/model/Official.dart';
import 'package:doandidong/model/user.dart';
import 'package:flutter/material.dart';
import 'package:doandidong/views/officialScrTH.dart';
import 'package:doandidong/views/officialScrTT.dart';

class OfficialScreen extends StatefulWidget {
  const OfficialScreen({super.key, required this.official});
  final Official official;
  @override
  State<OfficialScreen> createState() => _OfficialScreenState();
}

class _OfficialScreenState extends State<OfficialScreen> {
  User userCurrent = User("","","","Username","",true);
  Future<void> _loadUserDataFromFirestore() async {
  final userController = ControllerUserLogin();
  final user = await userController.getUserInfo();
  if (user != null) {
    final userData = await userController.getUserInfoFromFirestore(user.uid);
    if (userData != null) {
      setState(() {
         userCurrent.uid = user.uid;
         userCurrent.displayName = userData['displayName']??"Username";
         userCurrent.email = userData['email'].toString();
         userCurrent.password = userData['password'].toString();
         userCurrent.birthday = userData['birthday']??"1/1/2000";
         userCurrent.gender = userData['gender'].toString()==true?true:false;
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

  @override
  void initState() {
    super.initState();
    _loadUserDataFromFirestore();
    
  }

  iconFollowing() {
    if (ControllerOfficial.isFollowing(widget.official,userCurrent) == true) {
      return IconButton(
          onPressed: () {
            setState(() {
              ControllerOfficial.removeUserForChannel(widget.official,userCurrent);
            });
          },
          icon: const Icon(
            Icons.check_circle_outline_sharp,
            color: Colors.green,
          ));
    } else {
      return IconButton(
          onPressed: () {
            setState(() {
              ControllerOfficial.addUserForChannel(widget.official,userCurrent);
            });
          },
          icon: const Icon(
            Icons.add_circle_outline,
            color: Colors.green,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: const Color.fromRGBO(246, 238, 238, 1),
                  bottom: TabBar(
                    tabs: const [
                      Tab(text: 'Tổng hợp'),
                      Tab(text: 'Thông tin'),
                    ],
                    indicatorColor: Colors.green[300],
                    unselectedLabelColor: Colors.black,
                    labelColor: Colors.black,
                  ),
                  leading: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context)),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(widget.official.urlLogo),
                                fit: BoxFit.fill)),
                      ),
                      Text(
                        widget.official.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      iconFollowing()
                    ],
                  ),
                ),
                body: TabBarView(children: [
                  TongHop(
                      listNews: ControllerNews.getListNewsByOfficial(
                          widget.official.name)),
                  ThongTin(
                      description: widget.official.description,
                      email: widget.official.email,
                      address: widget.official.address,
                      phone: widget.official.phone,
                      website: widget.official.website),
                ]))));
  }
}
