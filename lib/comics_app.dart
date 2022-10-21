import 'package:comic_app/src/Comic/ui/screens/home_comics.dart';
import 'package:comic_app/src/User/ui/screens/favorites_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComicsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.indigo),
              activeIcon: Icon(Icons.home, color: Colors.blue),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border, color: Colors.indigo),
              activeIcon: Icon(Icons.star, color: Colors.blue),
              label: "",
            ),
          ],
        ),

        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context) => HomeComics(),
              );
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context) => FavoritesScreen(),
              );
            default:
              return CupertinoTabView(
                builder: (BuildContext context) => HomeComics(),
              );
          }
        },
      ),
    );
  }
}
