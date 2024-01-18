import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/trangchu/views/trangchu/canh.dart';
import 'package:flutter_application_1/quanLyThietBi/chieusang_screen.dart';
import 'package:flutter_application_1/ThietBi/detail.dart';
import 'package:flutter_application_1/trangchu/views/trangchu/cua.dart';
import 'package:flutter_application_1/trangchu/views/trangchu/giai_tri.dart';
import 'package:flutter_application_1/trangchu/views/trangchu/thiet_bi.dart';
import 'package:flutter_application_1/tranggiaitri/entertaiment_screen.dart';
import 'package:get/get.dart';

class ChucNangChinh extends StatefulWidget {
  const ChucNangChinh({super.key});

  @override
  State<ChucNangChinh> createState() => _ChucNangChinhState();
}

class _ChucNangChinhState extends State<ChucNangChinh> {
  final ref = FirebaseDatabase.instance.ref("SmartHome/Nha");
  bool cua = false;
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Cua(),
              CanhBao(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ThietBi(),
              GiaiTri(),
            ],
          ),
        ],
      ),
    );
  }
}
