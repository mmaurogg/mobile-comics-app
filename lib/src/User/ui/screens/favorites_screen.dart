import 'package:comic_app/src/Comic/model/comic.dart';
import 'package:comic_app/src/widgets/basic_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Comic/bloc/bloc_comic.dart';
import '../../bloc/bloc_user.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final comicBloc = Provider.of<ComicBloc>(context);
    final userBloc = Provider.of<UserBloc>(context);

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Favoritos'),
        ),
        elevation: 0,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                print('Hola favorito');
              },
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                userBloc.signOut();
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),

      body: Container(
          width: size.width,
          height: size.height - 100,
          child:
              ListView.separated(
                controller: scrollController,
                scrollDirection: Axis.vertical,
                itemCount: userBloc.favoriteComics.length,
                itemBuilder: (_, index) {
                  return Row(
                    children: <Widget>[
                      _CardPoster(
                          comic: userBloc.favoriteComics[index],
                          heroId:
                          '$index-${userBloc.favoriteComics[index].id}'
                      ),

                      GestureDetector(
                        onHorizontalDragStart: (details) {

                        },
                        onTap: () => userBloc.deleteFavorite(userBloc.favoriteComics[index].id.toString()),
                        child: const Icon(Icons.delete_forever),
                      ),
                    ],
                  );
                },
                separatorBuilder: (_, __) => const Divider(),
              ),
          ),
    );
  }
}

class _CardPoster extends StatelessWidget {
  final ComicModel comic;
  final String heroId;

  const _CardPoster({super.key, required this.comic, required this.heroId});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    comic.heroId = heroId;
    final urlImage =
        '${comic.thumbnail.path}/portrait_xlarge.${comic.thumbnail.extension}';

    return Container(
      width: size.width-50,
      child: Row(
        children: <Widget>[
          Hero(
            tag: comic.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/img/no-image.png'),
                image: NetworkImage(urlImage),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(
            width: 10,
          ),

          Container(
            width: size.width - 200,
            child: Column(
              children: [
                Text(
                  comic.title.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),

                const SizedBox(height: 8,),

                Text(
                  comic.prices.toString(),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}