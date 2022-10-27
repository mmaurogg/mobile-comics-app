import 'package:comic_app/src/Comic/model/comic.dart';
import 'package:comic_app/src/User/model/user.dart';
import 'package:test/test.dart';

void main(){

  ComicModel comic = ComicModel(
      id: 1,
      digitalId: 1,
      title: "Comic the best",
      issueNumber: 1,
      modified: "01/01/1900",
      pageCount: 10,
      textObjects: [],
      resourceUri: '',
      urls: [],
      series: Series(),
      variants: [],
      collections: [],
      collectedIssues: [],
      dates: [],
      prices: [],
      thumbnail: Thumbnail(),
      images: [],
      creators: Characters(items: []),
      characters: Characters(items: []),
      stories: Characters(items: []),
      events: Characters(items: [])
  );

  UserModel userComicLess = UserModel(uid: "1", name: "user without comic", photoURL: "photo.com/img", email: "usercomicless@yopmail.com");
  UserModel userComic = UserModel(uid: "1", name: "user without comic", photoURL: "photo.com/img", email: "usercomicless@yopmail.com", myFavoriteComics: [comic]);

  group('UserModel', () {

    test('Add a comic in list', () {
      //var userAddComic =
      userComicLess.addFavorite(comic);
      //expect(userAddComic[0], equals(comic));
      expect(userComicLess.favoriteComics[0], equals(comic));

    });

    test('Remove a comic in list', () {
      //var userDeleteComic =
      userComic.deleteFavorite(comic.id.toString());
      expect(userComic.favoriteComics, []);
    });

  });

}