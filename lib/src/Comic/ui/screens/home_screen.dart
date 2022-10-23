import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../bloc/bloc_comic.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final comicBloc = Provider.of<ComicBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Comics!!'),
        ),
        elevation: 0,
        actions: <Widget>[
          IconButton(onPressed: () {
            //comicBloc.loadComics();
            print(comicBloc.comics[0]);
          }, icon: Icon(Icons.search))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          CardSwiper(comics: comicBloc.comics),
          CardSlider(comics: comicBloc.comics, title: 'Comics', onNextPage: comicBloc.loadNextComics),
        ]),
      ),
    );
  }
}
