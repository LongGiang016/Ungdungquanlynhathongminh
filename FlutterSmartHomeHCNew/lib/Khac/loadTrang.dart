import 'package:flutter_application_1/Khac/lstData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Khac/trangchitiet.dart';

class bai10 extends StatefulWidget {
  const bai10({super.key});

  @override
  State<bai10> createState() => _bai10State();
}

class _bai10State extends State<bai10> {
  @override
  Widget build(BuildContext context) {
    List<lst> lstSmartPhone = List<lst>.filled(
      0,
      lst(hinh: "", thongtin: "", gia: ""),
      growable: true,
    );
    for (int i = 0; i < dataSmartPhone.lstPhone.length; i++) {
      lstSmartPhone.add(
        lst(
          hinh: dataSmartPhone.lstPhone[i].img,
          thongtin: dataSmartPhone.lstPhone[i].info,
          gia: dataSmartPhone.lstPhone[i].price,
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mobile App",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          childAspectRatio: 1 / 2,
          crossAxisSpacing: 10,
          shrinkWrap: true,
          children: [
            for (var i = 0; i < lstSmartPhone.length; i++) lstSmartPhone[i],
          ],
        ),
      ),
    );
  }
}
