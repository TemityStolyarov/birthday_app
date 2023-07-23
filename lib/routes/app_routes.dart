import 'package:flutter/material.dart';
import 'package:mobyte_birthday/feachures/dish_detail/pages/dish_detail_page.dart';
import 'package:mobyte_birthday/feachures/main/models/dish_name_model.dart';
import 'package:mobyte_birthday/routes/name_routes.dart';
import 'package:mobyte_birthday/feachures/guest/pages/guests_page.dart';
import 'package:mobyte_birthday/feachures/main/pages/main_page.dart';
import 'package:mobyte_birthday/feachures/wishlist/pages/wishlist_page.dart';

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
      case NameRoutes.dishdetail:
        final argument = routeSettings.arguments as DishNameModel;
        return MaterialPageRoute(
          builder: (_) => DishDetailPage(dishNameModel: argument),
        );
      default: //switch to error route in prod
        debugPrint('AppRouter: Page ${routeSettings.name} not found');
        return MaterialPageRoute(
          builder: (_) => const MainPage(),
        );
    }
  }
}
