import 'package:comic_app/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:comic_app/src/Comic/model/models.dart';
import 'package:comic_app/src/themes/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../User/bloc/bloc_user.dart';

class DetailsScreen extends StatelessWidget {
  late UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = Provider.of<UserBloc>(context);

    final ComicModel comic =
        ModalRoute.of(context)!.settings.arguments as ComicModel;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(comic),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(comic),

              ButtonGeneric(
                buttonText: 'Agregar a favoritos',
                color: AppTheme.primary,
                onTap: () {
                  userBloc.addFavorite(comic);

                  AlertNotification(context, 'Exito', '${comic.title} se agregó con exito');

                },
              ),

              _Overview(comic),
              //CardSlider(),
            ]),
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final ComicModel comic;

  const _CustomAppBar(this.comic);

  @override
  Widget build(BuildContext context) {
    final urlImage =
        '${comic.thumbnail.path}/portrait_uncanny.${comic.thumbnail.extension}';

    return SliverAppBar(
      actions: [
        IconButton(
          onPressed: () {
            Share.share(comic.urls.first.url ??
                'https://www.youtube.com/watch?v=dQw4w9WgXcQ');
          },
          icon: const Icon(Icons.share_outlined),
        ),
      ],
      backgroundColor: AppTheme.primary,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          color: Colors.black12,
          child: Text(
            comic.title.toString(),
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/img/loading.gif'),
          image: NetworkImage(urlImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final ComicModel comic;

  const _PosterAndTitle(this.comic);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final urlImage =
        '${comic.thumbnail.path}/portrait_uncanny.${comic.thumbnail.extension}';

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: comic.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/img/no-image.jpg'),
                image: NetworkImage(urlImage),
                height: 150,
              ),
            ),
          ),
          const SizedBox(width: 20),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comic.title.toString(),
                  style: textTheme.headlineSmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  comic.prices.toString(),
                  style: textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.chrome_reader_mode_outlined,
                      size: 20,
                      color: AppTheme.primary,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      comic.pageCount.toString(),
                      style: textTheme.caption,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final ComicModel comic;

  const _Overview(this.comic);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(
          children: [
            Text(
              'Description',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              comic.description.toString(),
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ));
  }
}
