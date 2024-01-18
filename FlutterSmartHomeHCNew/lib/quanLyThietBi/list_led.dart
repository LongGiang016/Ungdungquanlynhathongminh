import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class Led extends StatefulWidget {
  const Led({super.key});

  @override
  State<Led> createState() => _LedState();
}

class _LedState extends State<Led> {
  @override
  Widget build(BuildContext context) {
    final ref = FirebaseDatabase.instance.ref("SmartHome/phong");
    return Container(
      decoration: const BoxDecoration(border: Border(bottom: BorderSide())),
      child: FirebaseAnimatedList(
          query: ref,
          itemBuilder: (context, snapshot, animation, index) {
            return GestureDetector(
              onTap: () {
                ref.update({
                  "$index/trangthaiDen":
                      snapshot.child('trangthaiDen').value == 1 ? 0 : 1
                });
              },
              child: Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: snapshot.child('trangthaiDen').value == 0
                        ? Colors.white
                        : Colors.yellowAccent,
                    border: Border.all(width: 1)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(snapshot.child('Ten').value.toString()),
                    Text(snapshot.child('trangthaiDen').value == 0
                        ? "Tắt"
                        : "Sáng"),
                    IconButton(
                        onPressed: () {
                          ref.update({
                            "$index/trangthaiDen":
                                snapshot.child('trangthaiDen').value == 1
                                    ? 0
                                    : 1
                          });
                        },
                        icon: Icon(
                          Icons.light_mode_rounded,
                          color: snapshot.child('trangthaiDen').value == 0
                              ? Colors.black
                              : Colors.red,
                        )),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
