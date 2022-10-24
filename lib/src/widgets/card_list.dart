import 'package:comic_app/src/Comic/model/comic.dart';
import 'package:flutter/material.dart';

import '../themes/app_theme.dart';

class CardList extends StatefulWidget {
  final List<ComicModel> comics;
  final String? title;
  final dynamic? onNextPage;

  const CardList(
      {super.key, required this.comics, this.title, this.onNextPage});

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    if (widget.onNextPage != null) {
      scrollController.addListener(() {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 500) {
          widget.onNextPage();
          setState(() {});
        }
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(widget.title ?? '',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20))),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
              controller: scrollController,
              scrollDirection: Axis.vertical,
              itemCount: widget.comics.length,
              itemBuilder: (_, index) => _Card(
                  comic: widget.comics[index],
                  heroId:
                      '${widget.title.toString()}-$index-${widget.comics[index].id}'),
              separatorBuilder: (_, __) => const Divider(),
            ),
          ),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final ComicModel comic;
  final String heroId;

  const _Card({super.key, required this.comic, required this.heroId});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    comic.heroId = heroId;
    final urlImage =
        '${comic.thumbnail.path}/portrait_xlarge.${comic.thumbnail.extension}';

    return GestureDetector(
      child: Card(
          child: Column(
        children: [
          ListTile(
            leading: Hero(
              tag: comic.id,
              child: FadeInImage(
                placeholder: const AssetImage('assets/img/no-image.jpg'),
                image: NetworkImage(urlImage),
                width: 130,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              comic.title.toString(),
              textAlign: TextAlign.center,
            ),
            subtitle: Text(
              comic.prices.toString(),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 5,
          )
        ],
      )),
    );
  }
}
