import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/models.dart';

class CardSwiper extends StatelessWidget {
  final List<ComicModel> comics;

  CardSwiper({required this.comics});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (comics.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: const CupertinoActivityIndicator(),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: comics.length,
        layout: SwiperLayout.TINDER,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (_, index) {
          final comic = comics[index];

          final urlImage =
          '${comic.thumbnail.path}/portrait_uncanny.${comic.thumbnail.extension}';

          comic.heroId = 'swiper-${comic.id}';

          print(urlImage);

          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: comic),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/img/no-image.png'),
                image: NetworkImage(urlImage),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
