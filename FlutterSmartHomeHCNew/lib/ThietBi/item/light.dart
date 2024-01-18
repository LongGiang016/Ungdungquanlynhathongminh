import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/ThietBi/Load/Den.dart';




class Light extends StatefulWidget {
  const Light({super.key, required this.id});
  final int id;

  @override
  State<Light> createState() => _LightState();
}

class _LightState extends State<Light> {
  @override
  Widget build(BuildContext context) {
    bool _enabled = true;
    Den ned = Den.Dens.singleWhere((element) => element.id == widget.id );
    return Scaffold(
      appBar: AppBar(title: Text('Hệ thống Chiếu sáng') ),
      body: ListTile(
        leading:Icon(Icons.light),
        title: Text(ned.name),
        subtitle: Text(""),
        trailing: Switch(
            onChanged: (bool? value) {
              // This is called when the user toggles the switch.
              setState(() {
                _enabled = value!;
              });
            },
            value: _enabled,
          ),
      ),

    );
  }
}