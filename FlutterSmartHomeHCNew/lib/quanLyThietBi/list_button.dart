import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    final ref = FirebaseDatabase.instance.ref("SmartHome/ThietBi/Nut");
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
                  Text(snapshot.child('TenNut').value.toString()),
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
