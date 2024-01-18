import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/ThietBi/Load/Den.dart';
import 'package:flutter_application_1/ThietBi/item/l_D.dart';
import 'package:flutter_application_1/trangcanhan/views/accout_screen.dart';
import 'package:flutter_application_1/trangchu/Load_trang_chinh.dart';
import 'package:flutter_application_1/trangchu/views/trangchu/bottomNav.dart';

import 'menu.dart';

class ScreenLight extends StatefulWidget {
  const ScreenLight({super.key});

  @override
  State<ScreenLight> createState() => _ScreenLightState();
}

class _ScreenLightState extends State<ScreenLight> {
  List<Den> _Dens = List.filled(0, Den(0, ''), growable: true);
  void _loadData() {
    Den.loadData().then((value) {
      setState(() {
        _Dens = Den.Dens;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    final tabs = [
      const trangchitiet(),
      const AccountScreen(),
    ];
    int count = (_Dens.length).ceil();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hệ thống chiếu sáng"),
      ),
      // drawer: const Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => Add_TB() ));

          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 200,
                // color: Colors.blueAccent,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      const Text('Chọn phòng để thêm đèn chiếu sáng'),
                      ElevatedButton(
                        child: const Menu(),
                        onPressed: () => Navigator.pop(context),
                      ),
                      ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Icon(Icons.add))
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //       items: const [
      //         BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //         BottomNavigationBarItem(
      //             icon: Icon(Icons.account_box_rounded), label: 'Account'),
      //         BottomNavigationBarItem(
      //             icon: Icon(Icons.description), label: 'Thông báo'),
      //       ],
      //       currentIndex:  _currentIndex,
      //       onTap: (index){
      //         setState(() {
      //            _currentIndex=  index;
      //         });
      //       },
      //     ),
      //
      // NavigationBar(
      //   onDestinationSelected: (int index) {
      //     setState(() {
      //       Navigator.push(context,
      //           MaterialPageRoute(builder: (context) => const bottomNav()));
      //     });
      //   },
      //   // indicatorColor: Colors.amber,
      //   // selectedIndex: currentPageIndex,
      //   destinations: const <Widget>[
      //     NavigationDestination(
      //       selectedIcon: Icon(Icons.home),
      //       icon: Icon(Icons.home_outlined),
      //       label: 'Home',
      //     ),
      //     NavigationDestination(
      //       icon: Icon(Icons.account_circle),
      //       label: 'Profile',
      //     ),
      //     NavigationDestination(
      //       icon:
      //           // label: Text(''),
      //           Icon(Icons.messenger_sharp),
      //       label: 'Messages',
      //     ),
      //   ],
      // ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: count,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              l_Den(ned: _Dens[index]),
            ],
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }
}
