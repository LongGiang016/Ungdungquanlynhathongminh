import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyListView extends StatefulWidget {
  const MyListView({super.key});

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  final ref = FirebaseDatabase.instance.ref("SmartHome/phong");
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FirebaseAnimatedList(
          query: ref,
          itemBuilder: (context, snapshot, animation, index) {
            return ListTile(
              title: Text(snapshot.child('Ten').value.toString()),
            );
          },
        )
      ],
    );
  }
}
