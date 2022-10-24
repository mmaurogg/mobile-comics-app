import 'package:comic_app/src/Comic/model/comic.dart';
import 'package:flutter/material.dart';

import '../themes/app_theme.dart';

class BasicList extends StatefulWidget {
  final List<ComicModel> comics;
  final String? title;
  final dynamic? function;

  const BasicList(
      {super.key, required this.comics, this.title, this.function});

  @override
  State<BasicList> createState() => _BasicListState();
}

class _BasicListState extends State<BasicList> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

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
      height: size.height - 100,
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
              itemBuilder: (_, index) =>
                  Dismissible(
                    key: Key(widget.comics[index].id.toString()),
                    onDismissed: widget.function,
                    child: _ComicPoster(
                    comic: widget.comics[index],
                    heroId:
                        '${widget.title.toString()}-$index-${widget.comics[index].id}'),
                  ),
              separatorBuilder: (_, __) => const Divider(),
            ),
          ),

        ],
      ),
    );
  }
}

class _ComicPoster extends StatelessWidget {
  final ComicModel comic;
  final String heroId;

  const _ComicPoster({super.key, required this.comic, required this.heroId});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    comic.heroId = heroId;
    final urlImage =
        '${comic.thumbnail.path}/portrait_xlarge.${comic.thumbnail.extension}';

    return Container(
          width: size.width,
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
