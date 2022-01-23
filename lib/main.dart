import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_sample/mission.dart';

import 'home.dart';

const missionBox = "mission";

void main() async {
  //Hive başlatma
  await Hive.initFlutter();

  //Adapter'in kaydedilmesi
  Hive.registerAdapter(MissionAdapter());

  //box oluşturma
  await Hive.openBox(missionBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Flutter Mission Sample Hive App '),
    );
  }
}
