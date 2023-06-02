
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comic_app/src/Comic/model/comic.dart';
import 'package:comic_app/src/User/model/user.dart';
import 'package:comic_app/src/User/repository/cloud_firebase_api.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'cloud_firestore_api_test.mocks.dart';

/*
class MockCollectionReference extends Mock implements CollectionReference {
  final doc = Map();
}
 */

class CloudFrestoreApiTest extends Mock implements CloudFirestoreAPI {}

@GenerateMocks([CloudFrestoreApiTest])
void main() {

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

  UserModel user = UserModel(uid: "1", name: "user without comic", photoURL: "photo.com/img", email: "usercomicless@yopmail.com", myFavoriteComics: []);


  late MockCloudFrestoreApiTest firestoreApi = MockCloudFrestoreApiTest();

  dynamic ref = user.toJson();

  test('Get User Data by Id', () async {
    when( firestoreApi.dbUsers.doc('1') ).thenAnswer((_) => ref );

    print('ref is: ');
    print(ref);

    firestoreApi.getUserData('1').then((value) => expect(value, user));

    //expect(1, 1);
  });

}