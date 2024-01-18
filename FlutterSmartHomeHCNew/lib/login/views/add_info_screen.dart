import 'package:flutter/material.dart';
import 'package:flutter_application_1/login/views/login_screen.dart';
import 'package:flutter_application_1/login/views/signup_screen.dart';
import 'package:flutter_application_1/models/users_model.dart';
import 'package:restart_app/restart_app.dart';

class AddInfoScreen extends StatefulWidget {
  const AddInfoScreen({super.key, required this.email});
  final String email;

  @override
  State<AddInfoScreen> createState() => _AddInfoScreenState();
}

enum GioiTinh { nam, nu }

class _AddInfoScreenState extends State<AddInfoScreen> {
  GioiTinh? _gioiTinh = GioiTinh.nam;
  TextEditingController tenTaiKhoan = TextEditingController();
  TextEditingController maNha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/img/background.jpg"),
                fit: BoxFit.cover,
                opacity: 0.6)),
        padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
        child: Column(
          children: [
            const Image(
              image: AssetImage('assets/img/logo.png'),
              height: 200,
            ),
            const Text(
              "Who are you?",
              style: TextStyle(color: Colors.blue, fontSize: 30),
            ),
            TextFormField(
              controller: tenTaiKhoan,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  label: Text("Tên của bạn"),
                  hintText: 'Tên của bạn',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: maNha,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  label: Text("Mã nhà của bạn"),
                  hintText: 'Mã nhà của bạn',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                Text("Giới tính"),
              ],
            ),
            Container(
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: const Text('Nam'),
                    leading: Radio<GioiTinh>(
                      value: GioiTinh.nam,
                      groupValue: _gioiTinh,
                      onChanged: (GioiTinh? value) {
                        setState(() {
                          _gioiTinh = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Nữ'),
                    leading: Radio<GioiTinh>(
                      value: GioiTinh.nu,
                      groupValue: _gioiTinh,
                      onChanged: (GioiTinh? value) {
                        setState(() {
                          _gioiTinh = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final user = UserModel(
                        email: widget.email,
                        tenTaiKhoan: tenTaiKhoan.text.trim(),
                        maNha: int.parse(maNha.text.trim()),
                        gioiTinh: (GioiTinh.nam == true ? true : false),
                        quyen: 1);
                    createUser(user);
                    Restart.restartApp();
                  },
                  child: Text(
                    "Tiếp theo",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                )),
          ],
        ),
      ),
    );
  }
}
