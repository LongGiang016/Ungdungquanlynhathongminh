class dataGridView {
  String thietbi;
  String phong;

  dataGridView({required this.phong, required this.thietbi});

  List<dataGridView> data = [
    dataGridView(phong: "phòng ngủ", thietbi: "Đèn"),
    dataGridView(phong: "phòng khách", thietbi: "Đèn"),
    dataGridView(phong: "phòng học", thietbi: "Đèn"),
  ];
}
