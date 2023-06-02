import 'package:comic_app/src/widgets/alert_notificaction.dart';
import 'package:comic_app/utilities/timer/activity_detector.dart';
import 'package:comic_app/utilities/timer/timer_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:comic_app/src/User/bloc/bloc_user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:comic_app/src/router/app_routes.dart';
import 'package:comic_app/src/themes/app_theme.dart';
import 'package:comic_app/utilities/timer/timer_service_provider.dart';

import 'package:comic_app/src/Comic/bloc/bloc_comic.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserBloc(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ComicBloc(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => TimerService(
              //(context) => AlertNotification(context, 'Ya pasaron', '5 seg')
              //context,
              ),
          lazy: false,
        ),
      ],
      child: (true)
          ? ActivityDetector(
              onShouldNavigate: (context) => () {},
              //Navigator.pop(context),
              child: MyApp(),
            )
          : MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Comics App',
      theme: AppTheme.ligthTheme,
      //home: SignInScreen();
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      onGenerateRoute: AppRoutes.onGenerateRoute,
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
