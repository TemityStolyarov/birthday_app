import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:mobyte_birthday/core/constants.dart';
import 'package:mobyte_birthday/core/utils/routes/app_routes.dart';
import 'package:mobyte_birthday/feachures/guest/models/guest_model.dart';
import 'package:mobyte_birthday/feachures/wishlist/models/gift_model.dart';
import 'package:mobyte_birthday/generated/l10n.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

void main() {
  AndroidYandexMap.useAndroidViewSurface = false;
  runApp(const MainApp());
  getApplicationDocumentsDirectory().then(
    (appDocumentDirectory) {
      Hive.init(appDocumentDirectory.path);
    },
  );
  Hive.registerAdapter(GuestModelAdapter());
  Hive.registerAdapter(GiftModelAdapter());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MaterialApp(
      onGenerateRoute: appRouter.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        fontFamily: 'Jost',
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
