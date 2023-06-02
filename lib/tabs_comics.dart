import 'package:comic_app/src/Comic/ui/screens/home_screen.dart';
import 'package:comic_app/src/Comic/ui/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsComic extends StatelessWidget {
  const TabsComic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavegacionModel(),
      child: Scaffold(
        body: Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
        currentIndex: navegacionModel.paginaActual,
        onTap: (i) => navegacionModel.paginaActual = i,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.temple_buddhist_outlined, color: Colors.redAccent),
            activeIcon: Icon(Icons.temple_buddhist, color: Colors.red),
            label: "Comics",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border, color: Colors.redAccent),
            activeIcon: Icon(Icons.star, color: Colors.red),
            label: "Favoritos",
          ),
        ]);
  }
}

class Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      controller: navegacionModel.pageController,
      //physics: BouncingScrollPhysics(),
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[HomeScreen(), FavoritesScreen(), DetailsScreen()],
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;
  final PageController _pageController = PageController();

  int get paginaActual => _paginaActual;

  set paginaActual(int valor) {
    _paginaActual = valor;
    _pageController.animateToPage(valor,
        duration: const Duration(milliseconds: 250), curve: Curves.easeInOut);
    notifyListeners();
  }

  PageController get pageController => _pageController;
}
