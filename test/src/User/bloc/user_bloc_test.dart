import 'package:comic_app/src/User/model/user.dart';
import 'package:comic_app/src/User/repository/fire_auth_repository.dart';
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'user_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthRepository>()])
void main() {

  final _authRepository = MockAuthRepository();

  UserModel user = UserModel(uid: "1", name: "user without comic", photoURL: "photo.com/img", email: "usercomicless@yopmail.com", myFavoriteComics: []);

  test('when user sign in on Google', () async {

    //when( _authRepository.signInFirebase()).thenReturn(user);



  });
}