import 'package:comic_app/comics_app.dart';
import 'package:comic_app/src/Comic/ui/screens/screens.dart';
import 'package:comic_app/src/Comic/ui/screens/favorites_screen.dart';
import 'package:comic_app/src/router/app_routes.dart';
import 'package:comic_app/src/themes/app_theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Comics App',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: AppTheme.ligthTheme,
    );
  }
}
