

// class dataListView {
//   String thietbi;
//   String phong;

//   dataListView({required this.phong, required this.thietbi});

//   static List<dataListView> data = [
//     dataListView(phong: "Phòng ngủ", thietbi: "Đèn"),
//     dataListView(phong: "Phòng ngủ", thietbi: "Đèn"),
//   ];
// }





// Future<List<dynamic>> readJson() async {
//   final String response = await rootBundle.loadString('assets/data/datalist.json');
//   final data = await json.decode(response);
//   return data[0]['Result'];
// }


  
// Future<Map<String, dynamic>> loadData() async {
//   String jsonString =
//       await rootBundle.loadString('assets/data/datalist.json');
//   return json.decode(jsonString);
// }


// class Room {
//   final int id;
//   final String phong;
//   final int thietbi;

//   Room({
//     required this.id,
//     required this.phong,
//     required this.thietbi,
//   });

//   factory Room.fromJson(Map<String, dynamic> json) {
//     return Room(
//       id: json['id'],
//       phong: json['phong'],
//       thietbi: json['thietbi'],
//     );
//   }
// }