import 'package:flutter/material.dart';
import 'package:mobyte_birthday/routes/name_routes.dart';
import 'package:mobyte_birthday/ui/pages/guests_page.dart';
import 'package:mobyte_birthday/ui/pages/main_page.dart';
import 'package:mobyte_birthday/ui/pages/wishlist_page.dart';

class AppRouter {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case NameRoutes.main:
        return MaterialPageRoute(
          builder: (_) => const MainPage(),
        );
      case NameRoutes.guests:
        return MaterialPageRoute(
          builder: (_) => const GuestPage(),
        );
      case NameRoutes.wishlist:
        return MaterialPageRoute(
          builder: (_) => const WishlistPage(),
        );
      default: //switch to error route in prod
        debugPrint('AppRouter: Page ${routeSettings.name} not found');
        return MaterialPageRoute(
          builder: (_) => const Text('Error'),
        );
    }
  }
}
