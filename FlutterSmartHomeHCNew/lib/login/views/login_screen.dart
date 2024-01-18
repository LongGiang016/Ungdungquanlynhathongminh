import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/login/views/change_pass_screen.dart';
import 'package:flutter_application_1/login/views/signup_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  // ignore: non_constant_identifier_names
  bool hint_pass = true;
  // ignore: non_constant_identifier_names
  Color color_iconbtn = Colors.black;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void login() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      wrongLogin(e.code);
    }
  }

  void wrongLogin(String message) {
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
        padding: const EdgeInsets.fromLTRB(50, 150, 50, 0),
        child: Column(
          children: [
            const Image(image: AssetImage('assets/img/logo.png')),
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
              obscureText: widget.hint_pass,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.fingerprint),
                  label: const Text("Mật khẩu"),
                  hintText: 'Mật khẩu',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: () {
                        if (widget.hint_pass == true) {
                          setState(() {
                            widget.hint_pass = false;
                            widget.color_iconbtn = Colors.green;
                          });
                        } else {
                          setState(() {
                            widget.hint_pass = true;
                            widget.color_iconbtn = Colors.black;
                          });
                        }
                      },
                      icon: Icon(
                        Icons.remove_red_eye_sharp,
                        color: widget.color_iconbtn,
                      ))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => ChangePass()));
                    },
                    child: const Text(
                      "Quên mật khẩu?",
                      style: TextStyle(color: Colors.blue),
                    )),
              ],
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    login();
                  },
                  child: Text(
                    "Đăng nhập",
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
                const Text("Chưa có tài khoản?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => SignUpScreen(),
                          ));
                    },
                    child: const Text(
                      "Đăng ký",
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
