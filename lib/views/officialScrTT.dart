import 'package:flutter/material.dart';

class ThongTin extends StatelessWidget {
  const ThongTin({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Row(
          children: [
            Text('Truyền hình thông tấn'),
            Text('GPHD BCĐT số 329/GP TTĐT cấp 03/11/2017'),
            Text('Địa chỉ: Số 33 Lê Thánh Tông, Hoàn Kiếm, Hà Nội, VN'),
            Text('Email: media@vnews.gov.vn'),
            Text('Đường dây nóng: 088 816 11 61'),
            Text('Website: '),
          ],
        )
      ]),
    );
  }
}
