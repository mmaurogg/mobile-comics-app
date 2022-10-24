import 'package:comic_app/comics_app.dart';
import 'package:flutter/material.dart';

import '../Comic/ui/screens/screens.dart';

class AppRoutes{
  static const initialRoute = 'home';

  static Map<String, Widget Function(BuildContext)> routes = {
    'home': (_) => HomeScreen(),
    'details': (_) => DetailsScreen(),
    'favorites': (_) => FavoritesScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: ((context) => ComicsApp()));
  }
}


