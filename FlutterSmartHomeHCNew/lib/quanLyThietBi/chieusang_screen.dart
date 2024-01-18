import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/quanLyThietBi/list_button.dart';
import 'package:flutter_application_1/quanLyThietBi/list_lcd.dart';
import 'package:flutter_application_1/quanLyThietBi/list_led.dart';

class ChieuSang extends StatefulWidget {
  const ChieuSang({super.key});

  @override
  State<ChieuSang> createState() => _ChieuSangState();
}

class _ChieuSangState extends State<ChieuSang> {
  final ref = FirebaseDatabase.instance.ref("SmartHome/phong");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        
        title: const Text(
          'Thiết bị',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF518FFD),
      ),
        body: Container(
      padding: EdgeInsets.fromLTRB(5, 70, 5, 0),
      child: Column(
        children: <Widget>[
          Container(
                
                padding: const EdgeInsets.only(left: 3),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blueAccent,
                ),
                child: const Text(
                  "Danh sách đèn",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              ),
          Expanded(child: Led()),
          SizedBox(height: 5,),
          Container(
                padding: const EdgeInsets.only(left: 3),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blueAccent,
                ),
                child: const Text(
                  "Danh sách nút",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              ),
          Expanded(child: Button()),
          SizedBox(height: 5,),
          Container(
                padding: const EdgeInsets.only(left: 3),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blueAccent,
                ),
                child: const Text(
                  "Danh sách màn hình",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              ),
          Expanded(child: LCD()),
        ],
      ),
    ));
  }
}
