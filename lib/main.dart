import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:comic_app/src/router/app_routes.dart';
import 'package:comic_app/src/themes/app_theme.dart';

import 'package:comic_app/src/Comic/bloc/bloc_comic_provider.dart';


void main() => runApp(AppState());

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [

          ChangeNotifierProvider(create: (_) => ComicBloc(), lazy: false,),



        ],
      child: MyApp(),
    );
  }
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Comics App',
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.routes,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        theme: AppTheme.ligthTheme,
      );
  }

/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: ComicBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Comics App',
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.routes,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        theme: AppTheme.ligthTheme,
      ),

    );
  }
 */

}
