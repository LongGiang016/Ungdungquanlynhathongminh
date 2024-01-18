import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/DuLieuRealtime.dart';

class Rowbanner extends StatelessWidget {
  Rowbanner({super.key});
  final user = FirebaseAuth.instance.currentUser!;

  final db = FirebaseDatabase.instance
      .ref()
      .child('SmartHome/TaiKhoan/ThietBi')
      .push()
      .set(ThietBi());
  List lst_ThietBi = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/img/logo.png',
                width: MediaQuery.of(context).size.width / 4),
            Text(
              "Welcome \n${user.email!}",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              softWrap: true,
            ),
          ],
        )
      ],
    );
  }
}

void showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Chọn thiết bị",
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: (MediaQuery.of(context).size.height) / 2.2,
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(10),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          final snackBar = SnackBar(
                            content: const Text('Đang phát triển'),
                            action: SnackBarAction(
                              label: 'Đóng',
                              onPressed: () {
                                // Code xử lý khi nhấn vào nút đóng
                              },
                            ),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.light,
                                size: 40,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Đèn",
                                style: TextStyle(fontSize: 25),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.tv,
                              size: 40,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "TV",
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.speaker,
                              size: 40,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Loa",
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.wind_power,
                              size: 40,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Quạt",
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          final snackBar = SnackBar(
                            content: const Text('Đang phát triển'),
                            action: SnackBarAction(
                              label: 'Đóng',
                              onPressed: () {
                                // Code xử lý khi nhấn vào nút đóng
                              },
                            ),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 40,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Thêm Thiết Bị",
                                style: TextStyle(fontSize: 25),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ]),
      );
    },
  );
}
