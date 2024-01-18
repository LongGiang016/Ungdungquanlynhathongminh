import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/trangchu/model/loadtrang.dart';

void main(List<String> args) {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: myGirdView(),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class myGirdView extends StatefulWidget {
  const myGirdView({Key? key}) : super(key: key);

  @override
  State<myGirdView> createState() => _myGirdViewState();
}

class _myGirdViewState extends State<myGirdView> {
  List<dynamic> _items = [];

  @override
  void initState() {
    super.initState();
    nhandata();
  }

  Future<void> nhandata() async {
    final data = await laydulieu.loadData();
    setState(() {
      _items = data.sublist(0, 4);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool Swgiaitri = false;
    bool Swcanhbao = false;
    Color myColor = Colors.white;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 200,
        childAspectRatio: 1,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
      ),
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final item = _items[index];
        final giaitri = item['giaitri'];
        final trangthai = item['trangthai'];
        final canhbao = item['canhbao'];

        return GestureDetector(
          onTap: () {
            setState(() {
              print('Container được nhấn');
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(10),
              color: myColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.music_video_outlined,
                  size: 30,
                ),
                Text(
                  giaitri,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(trangthai),
              ],
            ),
          ),
        );
      },
    );
  }
}
