class LoaiThietBi {
  int? SoLuong;
  String? Ten;
  bool? TrangThai;
  int? id;

  LoaiThietBi({this.SoLuong, this.Ten, this.TrangThai, this.id});

  LoaiThietBi.fromSnapShot(Map<Object?, Object?> js) {
    SoLuong = int.parse(js['SoLuong'].toString());
    Ten = (js['Ten'].toString());
    TrangThai = bool.parse(js['TrangThai'].toString());
    id = int.parse(js['id'].toString());
  }
}

class ThietBi {
  int? LoaiThietBi;
  int? MaPhong;
  String? Ten;
  int? TrangThai;
  int? id;

  ThietBi({this.Ten, this.TrangThai, this.id, this.LoaiThietBi, this.MaPhong});

  ThietBi.fromSnapShot(Map<Object?, Object?> js) {
    MaPhong = int.parse(js['MaPhong'].toString());
    Ten = (js['Ten'].toString());
    TrangThai = int.parse(js['TrangThai'].toString());
    id = int.parse(js['id'].toString());
    LoaiThietBi = int.parse(js['LoaiThietBi'].toString());
  }
}

class TaiKhoan {
  int? GioiTinh;
  String? Email;
  bool? TrangThai;
  int? id;
  String? matKhau;
  String? TenTaiKhoan;
  int? Quyen;
  int? MaNha;

  TaiKhoan(
      {this.TrangThai,
      this.id,
      this.Email,
      this.GioiTinh,
      this.MaNha,
      this.TenTaiKhoan,
      this.matKhau,
      this.Quyen});

  TaiKhoan.fromSnapShot(Map<Object?, Object?> js) {
    Quyen = int.parse(js['Quyen'].toString());

    MaNha = int.parse(js['MaNha'].toString());
    TenTaiKhoan = (js['TenTaiKhoan'].toString());
    TrangThai = bool.parse(js['TrangThai'].toString());
    id = int.parse(js['id'].toString());
    GioiTinh = int.parse(js['GioiTinh'].toString());
    matKhau = (js['matKhau'].toString());
    TenTaiKhoan = (js['TenTaiKhoan'].toString());
  }
}
