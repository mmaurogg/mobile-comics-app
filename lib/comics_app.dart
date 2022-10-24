import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:comic_app/src/Comic/ui/screens/home_screen.dart';
import 'package:comic_app/src/User/ui/screens/favorites_screen.dart';


class ComicsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.temple_buddhist_outlined, color: Colors.redAccent),
              activeIcon: Icon(Icons.temple_buddhist, color: Colors.red),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border, color: Colors.redAccent),
              activeIcon: Icon(Icons.star, color: Colors.red),
              label: "",
            ),
          ],
        ),

        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context) => HomeScreen(),
              );
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context) => FavoritesScreen(),
              );
            default:
              return CupertinoTabView(
                builder: (BuildContext context) => HomeScreen(),
              );
          }
        },
      ),
    );
  }
}
