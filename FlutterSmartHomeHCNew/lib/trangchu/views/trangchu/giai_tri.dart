import 'package:flutter/material.dart';
import 'package:flutter_application_1/tranggiaitri/entertaiment_screen.dart';

class GiaiTri extends StatefulWidget {
  const GiaiTri({super.key});

  @override
  State<GiaiTri> createState() => _GiaiTriState();
}

class _GiaiTriState extends State<GiaiTri> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const Entertaiment_Screen()),
          );

          print("đã nhấn vào giải trí");
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
                    Icons.music_note_outlined,
                    
                  ),
                ),
                const Text(
                  "Giải trí",
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
