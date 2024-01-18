import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class LCD extends StatefulWidget {
  const LCD({super.key});

  @override
  State<LCD> createState() => _LCDState();
}

class _LCDState extends State<LCD> {
  @override
  Widget build(BuildContext context) {
    final ref = FirebaseDatabase.instance.ref("SmartHome/ThietBi/LCD");
    return Container(
      decoration: const BoxDecoration(border: Border(bottom: BorderSide())),
      child: FirebaseAnimatedList(
          query: ref,
          itemBuilder: (context, snapshot, animation, index) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white, border: Border.all(width: 1)),
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(snapshot.child('TenLCD').value.toString())),
                  Column(
                    children: [
                      Text(snapshot.child('ViTri').value.toString()),
                      Text('Số lương :' +
                          snapshot.child('SoLuong').value.toString())
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
