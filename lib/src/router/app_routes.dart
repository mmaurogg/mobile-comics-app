import 'package:comic_app/src/User/ui/screens/sign_in_screen.dart';
import 'package:comic_app/tabs_comics.dart';
import 'package:flutter/material.dart';

import '../Comic/ui/screens/screens.dart';

class AppRoutes{
  static const initialRoute = 'signin';

  static Map<String, Widget Function(BuildContext)> routes = {
    'signin': (_) => SignInScreen(),
    'home': (_) => HomeScreen(),
    'details': (_) => DetailsScreen(),
    'favorites': (_) => FavoritesScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: ((context) => TabsComic()));
  }
}


