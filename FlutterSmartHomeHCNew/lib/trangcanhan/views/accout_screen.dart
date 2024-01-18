import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'ListAccount.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

enum GioiTinhRad { nam, nu }

class _AccountScreenState extends State<AccountScreen> {
  String tenTaiKhoan = '';
  String email = '';
  String matkhau = '';
  int? Quyen;
  bool? GioiTinh;
  TextEditingController textFieldController = TextEditingController();
  final int _selectedOption = 0;
  String Textcanhbao = "";

  GioiTinhRad? _gioiTinh = GioiTinhRad.nam;

  final CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('Users');
  final user = FirebaseAuth.instance.currentUser!;
  //String uid = user.uid;

  @override
  void initState() {
    super.initState();
    getData();
    updateName();
  }

  Future<void> getData() async {
    QuerySnapshot querySnapshot;

    try {
      querySnapshot =
          await _collectionRef.where('Email', isEqualTo: user.email).get();

      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs) {
          print('Document data: ${doc.data()}');
          var data = doc.data() as Map<String, dynamic>;
          var name = data['TenTaiKhoan'];
          var pass = data['Email'];
          int quyen = data['Quyen'];
          var gioiTinh = data['GioiTinh'];
          var mk = data['Password'];

          setState(() {
            tenTaiKhoan = name;
            email = pass;
            Quyen = quyen;
            GioiTinh = gioiTinh;
            matkhau = mk;
          });
        }
      } else {
        print('Document does not exist on the database');
      }
    } catch (e) {
      print(e);
    }
  }

  final nameController = TextEditingController();
  final passwordbandau = TextEditingController();
  final passwordnhaplai = TextEditingController();

// Hàm cập nhật tên tài khoản
  Future<void> updateName() async {
    try {
      await _collectionRef
          .doc(user.email)
          .update({'TenTaiKhoan': nameController.text});
      print('Tên tài khoản đã được cập nhật thành công');
    } catch (e) {
      print(e);
    }
  }

  String KiemtraGioiTinh(bool? n) {
    if (n == true) {
      return "Nam";
    }
    return "Nữ";
  }

  String KiemtraQuyen(int? n) {
    if (n == 1) {
      return "Thành viên";
    }
    return "Chủ nhà";
  }
  String KiemTraAnh(bool? checkgt){
    if(checkgt== false){
      return 'https://static.vecteezy.com/system/resources/previews/002/002/257/non_2x/beautiful-woman-avatar-character-icon-free-vector.jpg';
    }
    return 'https://static.vecteezy.com/system/resources/thumbnails/002/002/403/small/man-with-beard-avatar-character-isolated-icon-free-vector.jpg';


  }
 
  //final User userProfile;
  void logout() {
    FirebaseAuth.instance.signOut();
  }

  CollectionReference users = FirebaseFirestore.instance.collection('Users');

  Future<void> updateUser(String name) async {
    QuerySnapshot querySnapshot =
        await users.where('Email', isEqualTo: user.email).get();
    if (querySnapshot.docs.isNotEmpty) {
      querySnapshot.docs.first.reference
          .update({'TenTaiKhoan': name})
          .then((value) => print("User Updated"))
          .catchError((error) => print("Failed to update user: $error"));
    } else {
      print('No user found with the provided email');
    }
  }

  Future<void> updateGioiTinh(bool name) async {
    QuerySnapshot querySnapshot =
        await users.where('Email', isEqualTo: user.email).get();
    if (querySnapshot.docs.isNotEmpty) {
      querySnapshot.docs.first.reference
          .update({'GioiTinh': name})
          .then((value) => print("User Updated"))
          .catchError((error) => print("Failed to update user: $error"));
    } else {
      print('No user found with the provided email');
    }
  }

  Future<void> updateMatKhau(String name) async {
    QuerySnapshot querySnapshot =
        await users.where('Email', isEqualTo: email).get();
    if (querySnapshot.docs.isNotEmpty) {
      querySnapshot.docs.first.reference
          .update({'Password': name})
          .then((value) => print("User Updated"))
          .catchError((error) => print("Failed to update user: $error"));
    } else {
      print('No user found with the provided email');
    }
  }
  

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                logout();
              },
              icon: const Icon(Icons.logout))
        ],
        automaticallyImplyLeading: false,
        title: const Text(
          'Tài khoản',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF518FFD),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(color: Color(0xFFF8F8F8)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 10,
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      height: 130,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 0.5, color: Colors.grey)),
                      child: Row(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(300),
                            ),
                            child:  Image.network(
                                KiemTraAnh(GioiTinh),
                                ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Họ và tên:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(tenTaiKhoan)
                                ],
                              ),
                              Row(
                                children: [
                                  const Text("Chức vụ:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(KiemtraQuyen(Quyen)),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 30),
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 0.5, color: Colors.grey)),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 3),
                            height: 30,
                            decoration: BoxDecoration(
                                color: const Color(0xFF518FFD),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                border:
                                    Border.all(width: 0.1, color: Colors.grey)),
                            child: const Row(
                              children: [
                                Text("Thông tin tài khoản",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 3, right: 3),
                            height: 30,
                            decoration: const BoxDecoration(
                                //border: Border.all(width: 0.1, color: Colors.grey)

                                ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Tên tài khoản: $tenTaiKhoan"),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    )),
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
                                            const Size.square(20)),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                  ),
                                  onPressed: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SizedBox(
                                            height: 500,
                                            child: Column(
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 50),
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFF518FFD),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                          width: 0.5,
                                                          color: Colors.grey)),
                                                  child: const Text(
                                                    "Chỉnh sửa tên tài khoản",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10,
                                                      vertical: 30),
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10),
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(
                                                            left: 5, right: 30),
                                                        height: 50,
                                                        width: 250,
                                                        child: TextFormField(
                                                          controller:
                                                              nameController,
                                                          decoration:
                                                              const InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  hintText:
                                                                      "Sửa tên tại đây.."),
                                                        ),
                                                      ),
                                                      const Icon(
                                                        Icons.person,
                                                        color:
                                                            Color(0xFF518FFD),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  style: ButtonStyle(
                                                    shape: MaterialStateProperty
                                                        .all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                    )),
                                                    minimumSize:
                                                        MaterialStateProperty
                                                            .all<Size>(
                                                                const Size(
                                                                    70, 50)),
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                      const Color(0xFF518FFD),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    if (nameController
                                                        .text.isEmpty) {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            title: const Text(
                                                                'Lỗi'),
                                                            content: const Text(
                                                                'Vui lòng không để trống trường dữ liệu'),
                                                            actions: <Widget>[
                                                              TextButton(
                                                                child:
                                                                    const Text(
                                                                        'Đóng'),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    } else {
                                                      updateUser(
                                                          nameController.text);
                                                          setState(() {
                                                            tenTaiKhoan = nameController.text;
                                                          });
                                                          Navigator.of(
                                                                          context)
                                                                      .pop();
                                                    }
                                                  },
                                                  child: const Text("Lưu"),
                                                )
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                  child: const Icon(
                                    Icons.edit,
                                    color: Color(0xFF31966B),
                                    size: 20,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 3, right: 3),
                            height: 30,
                            decoration: const BoxDecoration(
                                // border: Border.all(width: 0.5, color: Colors.grey)

                                ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "Giới tính : ${KiemtraGioiTinh(GioiTinh)}"),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    )),
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
                                            const Size.square(20)),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                  ),
                                  onPressed: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return StatefulBuilder(builder:
                                              (BuildContext context,
                                                  StateSetter setState) {
                                            return SizedBox(
                                              height: 300,
                                              child: Expanded(
                                                child: Column(
                                                  children: <Widget>[
                                                    Container(
                                                      margin: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 10,
                                                          vertical: 5),
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 50),
                                                      decoration: BoxDecoration(
                                                          color: const Color(
                                                              0xFF518FFD),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          border: Border.all(
                                                              width: 0.5,
                                                              color:
                                                                  Colors.grey)),
                                                      child: const Text(
                                                        "Chỉnh sửa giới tính",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                    ListTile(
                                                      title: const Text('Nam'),
                                                      leading:
                                                          Radio<GioiTinhRad>(
                                                        value: GioiTinhRad.nam,
                                                        groupValue: _gioiTinh,
                                                        onChanged: (GioiTinhRad?
                                                            value) {
                                                          setState(() {
                                                            _gioiTinh = value;
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                    ListTile(
                                                      title: const Text('Nữ'),
                                                      leading:
                                                          Radio<GioiTinhRad>(
                                                        value: GioiTinhRad.nu,
                                                        groupValue: _gioiTinh,
                                                        onChanged: (GioiTinhRad?
                                                            value) {
                                                          setState(() {
                                                            _gioiTinh = value;
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                    ElevatedButton(
                                                      style: ButtonStyle(
                                                        shape: MaterialStateProperty.all<
                                                                RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                        )),
                                                        minimumSize:
                                                            MaterialStateProperty
                                                                .all<Size>(
                                                                    const Size(
                                                                        70,
                                                                        50)),
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                          const Color(
                                                              0xFF518FFD),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        bool CheckGt =
                                                            _gioiTinh ==
                                                                    GioiTinhRad
                                                                        .nam
                                                                ? true
                                                                : false;
                                                        updateGioiTinh(CheckGt);

                                                        Navigator.of(
                                                                          context)
                                                                      .pop();
                                                      },
                                                      child: const Text("Lưu"),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                        });
                                  },
                                  child: const Icon(
                                    Icons.edit,
                                    color: Color(0xFF31966B),
                                    size: 20,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 3, right: 3),
                            height: 30,
                            decoration: const BoxDecoration(
                                // border: Border.all(width: 0.5, color: Colors.grey)

                                ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Gmail: $email"),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    )),
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(
                                            const Size.square(20)),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                  ),
                                  onPressed: () {},
                                  child: const Icon(
                                    Icons.check,
                                    color: Color(0xFF31966B),
                                    size: 20,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 0.5, color: Colors.grey)),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 3),
                            height: 30,
                            decoration: BoxDecoration(
                                color: const Color(0xFF518FFD),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                border:
                                    Border.all(width: 0.1, color: Colors.grey)),
                            child: const Row(
                              children: [
                                Text(
                                  "Thành viên",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                    ListAcout()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
