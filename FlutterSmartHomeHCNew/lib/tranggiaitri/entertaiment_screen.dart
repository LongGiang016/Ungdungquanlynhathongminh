import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:metaballs/metaballs.dart';

class Entertaiment_Screen extends StatefulWidget {
  const Entertaiment_Screen({super.key});

  @override
  State<Entertaiment_Screen> createState() => _Entertaiment_ScreenState();
}

class _Entertaiment_ScreenState extends State<Entertaiment_Screen>
    with SingleTickerProviderStateMixin {
  bool is_checked = false;
  int? _cheDo = 1;
  int colorEffectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(
                center: Alignment.bottomCenter,
                radius: 1.5,
                colors: [
              Color.fromARGB(255, 13, 35, 61),
              Colors.black,
            ])),
        child: Metaballs(
          effect: MetaballsEffect.speedup(),
          glowRadius: 1,
          glowIntensity: 0.6,
          maxBallRadius: 50,
          minBallRadius: 20,
          metaballs: 40,
          color: Colors.grey,
          gradient: LinearGradient(
              colors: colorsAndEffects[colorEffectIndex].colors,
              begin: Alignment.bottomRight,
              end: Alignment.topLeft),
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                color: Colors.white.withOpacity(0.6),
              ),
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.all(16.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Column(
                        children: [
                          Icon(Icons.play_circle_outlined),
                          Text("Cần gì thứ 7, hãy cứ quẩy")
                        ],
                      ),
                      Row(
                        children: [
                          const Text("Off"),
                          Switch(
                              value: is_checked,
                              onChanged: (bool value) {
                                setState(() {
                                  is_checked = value;
                                });
                              }),
                          const Text("On"),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Radio(
                              value: 1,
                              groupValue: _cheDo,
                              onChanged: (index) {
                                setState(() {
                                  _cheDo = index;
                                  if (is_checked) {
                                    FirebaseDatabase.instance
                                        .ref()
                                        .child('/SmartHome/phong/0')
                                        .update({
                                      'trangthaiDen': 2,
                                    });
                                  }
                                });
                              }),
                          Text('Chế độ 1')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: 2,
                              groupValue: _cheDo,
                              onChanged: (index) {
                                setState(() {
                                  _cheDo = index;
                                  if (is_checked) {
                                    FirebaseDatabase.instance
                                        .ref()
                                        .child('/SmartHome/phong/0')
                                        .update({
                                      'trangthaiDen': 3,
                                    });
                                  }
                                });
                              }),
                          Text('Chế độ 2')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: 3,
                              groupValue: _cheDo,
                              onChanged: (index) {
                                setState(() {
                                  _cheDo = index;
                                  if (is_checked) {
                                    FirebaseDatabase.instance
                                        .ref()
                                        .child('/SmartHome/phong/0')
                                        .update({
                                      'trangthaiDen': 4,
                                    });
                                  }
                                });
                              }),
                          Text('Chế độ 3')
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ColorsEffectPair {
  final List<Color> colors;
  final MetaballsEffect? effect;
  final String name;

  ColorsEffectPair({
    required this.colors,
    required this.name,
    required this.effect,
  });
}

List<ColorsEffectPair> colorsAndEffects = [
  ColorsEffectPair(colors: [
    const Color.fromARGB(255, 255, 21, 0),
    const Color.fromARGB(255, 255, 153, 0),
  ], effect: MetaballsEffect.follow(), name: 'FOLLOW'),
  ColorsEffectPair(colors: [
    const Color.fromARGB(255, 0, 255, 106),
    const Color.fromARGB(255, 255, 251, 0),
  ], effect: MetaballsEffect.grow(), name: 'GROW'),
  ColorsEffectPair(colors: [
    const Color.fromARGB(255, 90, 60, 255),
    const Color.fromARGB(255, 120, 255, 255),
  ], effect: MetaballsEffect.speedup(), name: 'SPEEDUP'),
  ColorsEffectPair(colors: [
    const Color.fromARGB(255, 255, 60, 120),
    const Color.fromARGB(255, 237, 120, 255),
  ], effect: MetaballsEffect.ripple(), name: 'RIPPLE'),
  ColorsEffectPair(colors: [
    const Color.fromARGB(255, 120, 217, 255),
    const Color.fromARGB(255, 255, 234, 214),
  ], effect: null, name: 'NONE'),
];
