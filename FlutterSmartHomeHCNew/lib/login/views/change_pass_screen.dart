import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({super.key});

  @override
  State<ChangePass> createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  TextEditingController email = TextEditingController();
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  Future resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(
                  "Link reset mật khẩu đã được gửi! Vui lòng kiếm tra email"),
            );
          });
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/img/background.jpg"),
                fit: BoxFit.cover,
                opacity: 0.6)),
        padding: const EdgeInsets.fromLTRB(50, 150, 50, 50),
        child: Column(
          children: [
            const Text(
              "Nhập email của bạn để chúng tôi gửi bạn đường dẫn reset mật khẩu",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            TextFormField(
              controller: email,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  label: Text("Email"),
                  hintText: 'Email',
                  border: OutlineInputBorder()),
            ),
            ElevatedButton(
                onPressed: () {
                  resetPassword();
                },
                child: const Text("Xác nhận"))
          ],
        ),
      ),
    );
  }
}
