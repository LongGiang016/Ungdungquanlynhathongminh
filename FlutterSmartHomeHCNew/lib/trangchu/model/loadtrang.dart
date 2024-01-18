import 'dart:convert';


import 'package:flutter/services.dart';

class laydulieu {
 static Future<List<dynamic>> loadData() async {
    final response = await rootBundle.loadString("assets/data/datalist.json");
    final data = await json.decode(response);
    return data['data'];
  }
}
