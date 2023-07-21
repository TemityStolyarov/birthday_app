import 'package:flutter/material.dart';
import 'package:mobyte_birthday/core/constants.dart';
import 'package:mobyte_birthday/routes/app_routes.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

void main() {
  AndroidYandexMap.useAndroidViewSurface = false;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MaterialApp(
      onGenerateRoute: appRouter.onGenerateRoute,
      debugShowMaterialGrid: false, //TODO: убрать debug grid
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        fontFamily: 'Jost',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
    );
  }
}
