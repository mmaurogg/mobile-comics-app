import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../model/models.dart';

class CardSwiper extends StatelessWidget {

    //final List<ComicModel> comics;

    //CardSwiper({ required this.comics});

    @override
    Widget build(BuildContext context) {

      final size = MediaQuery.of(context).size;

      /*
      if( comics.length == 0){
        return Container(
          width: double.infinity,
          height: size.height * 0.5,
          child: CupertinoActivityIndicator(),
        );
      }

       */

      return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: Swiper(
          itemCount: 10,
          layout: SwiperLayout.TINDER,
          itemWidth: size.width * 0.6,
          itemHeight: size.height * 0.4,
          itemBuilder: (_, index) {

            //final comic = comics[index];

            //comic.heroId = 'swiper-${comic.id}';

            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'details', arguments: 'comic'),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const FadeInImage(
                  placeholder: AssetImage('assets/img/no-image.png'),
                  image: NetworkImage('https://via.placeholder.com/300x400'),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      );
    }

}
