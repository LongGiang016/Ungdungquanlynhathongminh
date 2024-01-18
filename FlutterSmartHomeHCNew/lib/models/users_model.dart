class UserModel {
  final String? id;
  final String? email;
  final String? tenTaiKhoan;
  final bool? gioiTinh;
  final int? maNha;
  final int? quyen;
  const UserModel(
      {this.id,
      required this.email,
      required this.gioiTinh,
      required this.maNha,
      required this.tenTaiKhoan,
      required this.quyen});

  toJson() {
    return {
      "Email": email,
      "TenTaiKhoan": tenTaiKhoan,
      "GioiTinh": gioiTinh,
      "MaNha": maNha,
      "Quyen": quyen
    };
  }
}
