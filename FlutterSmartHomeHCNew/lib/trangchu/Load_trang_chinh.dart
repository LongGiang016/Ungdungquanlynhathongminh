import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/trangchu/views/trangchu/ChucNangChinh_screen.dart';
import 'package:flutter_application_1/trangchu/views/trangchu/Rowbanner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class trangchitiet extends StatefulWidget {
  const trangchitiet({super.key});

  @override
  State<trangchitiet> createState() => _trangchitietState();
}

class _trangchitietState extends State<trangchitiet> {
 
  final refPhong = FirebaseDatabase.instance.ref("SmartHome/phong");
  final refThietBi = FirebaseDatabase.instance.ref("SmartHome/ThietBi");
  final ref = FirebaseDatabase.instance.ref("SmartHome/phong");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
        child: Container(
          margin: const EdgeInsets.only(top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Rowbanner(),
              const SizedBox(
                height: 10,
              ),
              Divider(),
              Container(
                padding: const EdgeInsets.only(left: 3),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blueAccent,
                ),
                child: const Text(
                  "Danh sách phòng",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: Container(
                child: FirebaseAnimatedList(
                    query: refPhong,
                    itemBuilder: (context, snapshot, animation, index) {
                      return GestureDetector(
                        onTap: () {
                          ref.update({
                            "$index/trangthaiDen":
                                snapshot.child('trangthaiDen').value == 1 ? 0 : 1
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
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
                                          snapshot.child('trangthaiDen').value ==
                                                  1
                                              ? 0
                                              : 1
                                    });
                                  },
                                  icon: Icon(
                                    Icons.light_mode_rounded,
                                    color:
                                        snapshot.child('trangthaiDen').value == 0
                                            ? Colors.black
                                            : Colors.red,
                                  )),
                            ],
                          ),
                        ),
                      );
                    }),
              )),
              Divider(),
              const SizedBox(
                height: 5,
              ),
               Container(
                padding: const EdgeInsets.only(left: 3),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blueAccent,
                ),
                child: const Text(
                  "Danh sách chức năng",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              // Expanded(child: myGirdView()),
              const ChucNangChinh(),
              //bottomNav()
            ],
          ),
        ),
      ),
    );
  }
}
