import 'package:flutter/material.dart';

class lst extends StatelessWidget {
  String hinh;
  String thongtin;
  String gia;
  lst({
    super.key,
    required this.hinh,
    required this.thongtin,
    required this.gia,
  });

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    return Expanded(
      flex: 1,
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              hinh,
              height: deviceHeight / 3,
              fit: BoxFit.contain,
            ),
            Text(thongtin, textAlign: TextAlign.center),
            Text(
              gia,
              style: const TextStyle(color: Colors.red),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  backgroundColor: Colors.blue),
              onPressed: () {},
              child: const Expanded(
                flex: 2,
                child: Text(
                  "Xem chi tiết",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
