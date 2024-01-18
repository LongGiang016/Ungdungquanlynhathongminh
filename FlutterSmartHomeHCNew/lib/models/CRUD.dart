// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter_application_1/models/DuLieuRealtime.dart';

// class databaseSmartHome {
//   //Get Thiet Bi
//   static Future<List<ThietBi>> GetThietBi() async {
//     DataSnapshot Snapshot =
//         await FirebaseDatabase.instance.ref().child('ThietBi').get();

//     DatabaseReference ref = FirebaseDatabase.instance.ref();

//     List<ThietBi> dataThietBi = [];

//     List<dynamic> values = Snapshot.value as List<dynamic>;

//     for (var vl in values) {
//       dataThietBi.add(ThietBi.fromSnapShot(vl as Map<Object?, Object?>));
//     }
//     return dataThietBi;
//   }

//   //Get Tai Khoan
//   static Future<List<TaiKhoan>> GetTaiKhoan() async {
//     DataSnapshot Snapshot =
//         await FirebaseDatabase.instance.ref().child('TaiKhoan').get();

//     DatabaseReference ref = FirebaseDatabase.instance.ref();

//     List<TaiKhoan> dataTaiKhoan = [];

//     List<dynamic> values = Snapshot.value as List<dynamic>;

//     for (var vl in values) {
//       dataTaiKhoan.add(TaiKhoan.fromSnapShot(vl as Map<Object?, Object?>));
//     }
//     return dataTaiKhoan;
//   }

//   //UpDate
//   static Future<void> UpdateData(ThietBi thietBi) async {
//     final DatabaseReference = FirebaseDatabase.instance.ref();
//     DatabaseReference.child('');
//   }
// }
