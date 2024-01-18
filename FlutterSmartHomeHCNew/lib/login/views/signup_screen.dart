import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login/views/add_info_screen.dart';
import 'package:flutter_application_1/login/views/login_screen.dart';
import 'package:flutter_application_1/models/users_model.dart';
import 'package:flutter_application_1/repository/user_repository.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  bool hint_pass = true;
  Color color_iconbtn = Colors.black;
  bool hint_pass2 = true;
  Color color_iconbtn2 = Colors.black;
  bool check = true;
  void signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
    } on FirebaseAuthException catch (e) {
      wrongSignUp(e.code);
      check = false;
    }
  }

  void checkSignup() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => AddInfoScreen(
                  email: email.text,
                )));
  }

  void wrongSignUp(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: Text(message),
            ),
          );
        });
  }

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
              height: 300,
            ),
            const Text(
              "Đăng ký",
              style: TextStyle(color: Colors.blue, fontSize: 30),
            ),
            TextFormField(
              controller: email,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  label: Text("Email"),
                  hintText: 'Email',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: password,
              obscureText: hint_pass,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.fingerprint),
                  label: const Text("Mật khẩu"),
                  hintText: 'Mật khẩu',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: () {
                        if (hint_pass == true) {
                          setState(() {
                            hint_pass = false;
                            color_iconbtn = Colors.green;
                          });
                        } else {
                          setState(() {
                            hint_pass = true;
                            color_iconbtn = Colors.black;
                          });
                        }
                      },
                      icon: Icon(
                        Icons.remove_red_eye_sharp,
                        color: color_iconbtn,
                      ))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: rePassword,
              obscureText: hint_pass2,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.fingerprint),
                  label: const Text("Xác nhận mật khẩu"),
                  hintText: 'Xác nhận mật khẩu',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: () {
                        if (hint_pass2 == true) {
                          setState(() {
                            hint_pass2 = false;
                            color_iconbtn2 = Colors.green;
                          });
                        } else {
                          setState(() {
                            hint_pass2 = true;
                            color_iconbtn2 = Colors.black;
                          });
                        }
                      },
                      icon: Icon(
                        Icons.remove_red_eye_sharp,
                        color: color_iconbtn2,
                      ))),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (password.text == rePassword.text) {
                      signUp();
                      checkSignup();
                    }
                  },
                  child: Text(
                    "Tiếp theo",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                )),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Đã có tài khoản?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => LoginScreen(),
                          ));
                    },
                    child: const Text(
                      "Đăng nhập",
                      style: TextStyle(color: Colors.blue),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Future<void> createUser(UserModel user) async {
  await Get.put(UserRepository()).createUser(user);
}
