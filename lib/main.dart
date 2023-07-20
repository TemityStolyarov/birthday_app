import 'package:flutter/material.dart';
import 'package:mobyte_birthday/core/constants.dart';
import 'package:mobyte_birthday/ui/pages/main_page/main_page.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

void main() {
  runApp(const MainApp());
  AndroidYandexMap.useAndroidViewSurface = false;
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false, //TODO: убрать debug grid
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        fontFamily: 'Jost',
      ),
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}