import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class Cua extends StatefulWidget {
  const Cua({super.key});

  @override
  State<Cua> createState() => _CuaState();
}

class _CuaState extends State<Cua> {
  final ref = FirebaseDatabase.instance.ref("SmartHome/Nha");
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.55,
      height: MediaQuery.of(context).size.height / 5.5,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: FirebaseAnimatedList(
          query: ref,
          itemBuilder: (context, snapshot, animation, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        ref.update({
                          "0/TrangThaiCua":
                              snapshot.child('TrangThaiCua').value == 1 ? 0 : 1
                        });
                      });
                    },
                    icon: Icon(
                      Icons.power_settings_new_outlined,
                      color: snapshot.child('TrangThaiCua').value == 1
                          ? Colors.blue
                          : Colors.black,
                    ),
                    iconSize: 30,
                  ),
                ),
                const Text(
                  "Cửa",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold)
                ),
              ],
            );
          }),
    );
  }
}
