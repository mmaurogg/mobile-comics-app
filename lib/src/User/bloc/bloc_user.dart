import 'package:comic_app/src/Comic/model/comic.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../model/user.dart';
import '../repository/cloud_firebase_repository.dart';
import '../repository/fire_auth_repository.dart';


class UserBloc extends ChangeNotifier {
  final _authRepository = AuthRepository();
  final _cloudFirestoreRepository = CloudFirestoreRepository();

  Stream<User?> streeamFirebase = FirebaseAuth.instance.authStateChanges();

  String idUserActivate = '';
  UserModel userActive = {} as UserModel;

  Stream<User?> get authStatus => streeamFirebase;

  //Casos de uso (el block contiene la logica del negocio)

  //1. SignIn a la palicación con Google
  Future<UserCredential> signIn() => _authRepository.signInFirebase()
      .then((userResponse) {
        idUserActivate = userResponse.user!.uid;
        return userResponse;
      });

  //2. SignOut de la aplicación
  signOut() {
    idUserActivate = '';
    //userActive = null;
    _authRepository.signOut();
  }

  //3. Registrar info del usuario en BD
  updateUserData(UserModel user) {
    return _cloudFirestoreRepository.updateUserDataFirestore(user);
  }

  //4. agregar comic a favorito
  addFavorite( ComicModel comic){
    if(userActive == null){
      getUserData(idUserActivate);
    }
    userActive!.addFavorite(comic);

    userActive!.myFavoriteComics!.forEach((element) {
      print(element.title);
    },);

    updateUserData(userActive!);

    notifyListeners();
  }





  // cargar usuario
  getUserData( String uid  ) => _cloudFirestoreRepository.getUserDataFirestore(uid)
      .then((userResponse) {

      print('Hola get user');

        UserModel userTemp = UserModel(
            uid: userResponse['uid'],
            name: userResponse['name'],
            photoURL: userResponse['photoURL'],
            email: userResponse['email'],
            myFavoriteComics: userResponse['myFavoriteComics']
        );

        userActive = userTemp;

        return userResponse;
      });



}