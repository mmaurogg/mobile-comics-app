import 'package:comic_app/src/widgets/alert_notificaction.dart';
import 'package:flutter/material.dart';
import '../../../User/bloc/bloc_user.dart';
import '../widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../bloc/bloc_comic.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final comicBloc = Provider.of<ComicBloc>(context);
    final userBloc = Provider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Comics'),
        ),
        elevation: 0,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                AlertNotification(context, 'En construcción', 'Pronto podrás disfrutar de esta funcionalidad');
              },
              icon: Icon(Icons.search)),

          IconButton(
              onPressed: () {
                userBloc.signOut();
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          CardSwiper(comics: comicBloc.comics),
          CardSlider(comics: comicBloc.comics, title: 'Comics', onNextPage: comicBloc.loadNextComics),
          //BasicList(comics: comicBloc.comics, title: 'Comics', onNextPage: comicBloc.loadNextComics)
        ]),
      ),
    );
  }
}

