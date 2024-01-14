import 'package:flutter/material.dart';

class ThongTin extends StatelessWidget {
  const ThongTin({super.key,required this.description,required this.email,required this.address,required this.phone,required this.website});
  final String email;
  final String description;
  final String address;
  final String phone;
  final String website;

  style(){
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(description,style: style(),),
        Text('Địa chỉ: $address',style: style(),),
        Text('Email: $email',style: style(),),
        Text('Đường dây nóng: $phone',style: style(),),
        Text('Website: $website',style: style(),)
      ]),
    );
  }
}
