import 'package:comic_app/src/User/bloc/bloc_user.dart';
import 'package:comic_app/src/User/model/user.dart';
import 'package:comic_app/src/User/repository/fire_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../repository/cloud_firestore_api_test.mocks.dart';
import 'user_bloc_test.mocks.dart';

//class UserBlocTest() extends Mock implements UserBloc {}

@GenerateMocks([UserBloc])
void main() {

  //MockUserBloc userBloc = MockUserBloc();
  UserBloc userBloc = UserBloc();
  MockCloudFrestoreApiTest cloudFrestoreApi = MockCloudFrestoreApiTest();



  UserModel user = UserModel(uid: "1", name: "user without comic", photoURL: "photo.com/img", email: "usercomicless@yopmail.com", myFavoriteComics: []);

  test('when user sign in on Google', () async {



  });



}