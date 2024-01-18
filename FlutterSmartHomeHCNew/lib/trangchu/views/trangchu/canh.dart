import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_options.dart';

class CanhBao extends StatefulWidget {
  const CanhBao({
    super.key,
  });

  @override
  State<CanhBao> createState() => _CanhBaoState();
}

class _CanhBaoState extends State<CanhBao> {
  final ref = FirebaseDatabase.instance.ref("SmartHome/Nha");
  bool isUpdating = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: MediaQuery.of(context).size.width / 2.5,
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
                  child: Icon(
                    size: 55,
                    Icons.warning,
                    color: snapshot.child('chay').value == 1
                        ? Colors.yellow
                        : Colors.black,
                  ),
                ),
                const Text(
                  "Báo cháy ",
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

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     name: 'SmartHome',
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(
//     const MaterialApp(
//       home: Scaffold(
//         body: CanhBao(),
//       ),
//     ),
//   );
// }
