import 'package:comic_app/src/Comic/model/comic.dart';
import 'package:flutter/material.dart';

class CardSlider extends StatefulWidget {
  final List<ComicModel> comics;
  final String title;
  final dynamic? onNextPage;

  const CardSlider(
      {super.key, required this.comics, required this.title, this.onNextPage});

  @override
  State<CardSlider> createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 500) {
        widget.onNextPage();
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(widget.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20))),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              //itemCount: 10,
              itemCount: widget.comics.length,
              itemBuilder: (_, index) => _ComicPoster(
                  comic: widget.comics[index],
                  heroId:
                      '${widget.title.toString()}-$index-${widget.comics[index].id}'),
              //itemBuilder: (_, index) => _ComicPoster(),
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
    comic.heroId = heroId;
    final urlImage =
        '${comic.thumbnail.path}/portrait_medium.${comic.thumbnail.extension}';

    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: comic),
            child: Hero(
              tag: comic.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/img/no-image.jpg'),
                  image: NetworkImage(urlImage),
                  width: 130,
                  height: 190,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            comic.title.toString(),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
