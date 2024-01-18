import 'package:flutter/material.dart';
import 'package:flutter_application_1/quanLyThietBi/chieusang_screen.dart';

class ThietBi extends StatefulWidget {
  const ThietBi({super.key});

  @override
  State<ThietBi> createState() => _ThietBiState();
}

class _ThietBiState extends State<ThietBi> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          print("đã nhấn vào thiết bị");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChieuSang()),
          );
        });
      },
      child:Container(
          width: MediaQuery.of(context).size.width / 2.55,
           height: MediaQuery.of(context).size.height / 5.5,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Icon(
                    size: 55,
                    Icons.light,
                    
                  ),
                ),
                const Text(
                  "Thiết bị",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold)
                ),
              ],
            )
      )
    );
  }
}
