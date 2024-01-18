import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'SmartHome',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(
    home: Cua(),
  ));
}

class Cua extends StatefulWidget {
  const Cua({super.key});

  @override
  State<Cua> createState() => _CuaState();
}

class _CuaState extends State<Cua> {
  @override
  Widget build(BuildContext context) {
    final refCua = FirebaseDatabase.instance.ref("SmartHome/Nha");
    bool cua = true;
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.height / 4,
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(width: 2),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: FirebaseAnimatedList(
          query: refCua,
          itemBuilder: (context, snapshot, animation, index) {
            return Column(
              children: [
                const Text(
                  "Cửa ",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        refCua.update({
                          "0/TrangThaiCua":
                              snapshot.child('TrangThaiCua').value == true
                                  ? false
                                  : true
                        });
                      });
                    },
                    icon: Icon(
                      Icons.power_settings_new_outlined,
                      color: snapshot.child('TrangThaiCua').value == true
                          ? Colors.blue
                          : Colors.black,
                    ),
                    iconSize: 30,
                  ),
                ),
              ],
            );
          }),
    ));
  }
}
