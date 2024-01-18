import 'dart:convert';

import 'package:flutter_application_1/ThietBi/Load/readD.dart';


class Den{
  int id;
  String name;

  Den(this.id, this.name);

  Den.fromJson(Map<String, dynamic> json)
  : id = json['id'],
  name = json['name'];
  

  static List<Den> Dens = List.filled(0, Den(0, ''), growable: true);

  static Future<void> loadData() async {
    InfoReader reader = InfoReader();
    String data = await reader.getInfo();
    List<dynamic> lst = jsonDecode(data);
    for (var entry in lst){
      Dens.add(Den.fromJson(entry));
    }
  }
}