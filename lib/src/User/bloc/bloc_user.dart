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
  UserModel? userActive;

  Stream<User?> get authStatus => streeamFirebase;

  //Casos de uso

  //1. SignIn a la palicación con Google
  Future<UserCredential> signIn() => _authRepository.signInFirebase()
      .then((userResponse) {
        idUserActivate = userResponse.user!.uid;
        return userResponse;
      });

  //2. SignOut de la aplicación
  signOut() {
    idUserActivate = '';
    userActive = null;
    _authRepository.signOut();
  }

  //3. Registrar info del usuario en BD
  updateUserData(UserModel user) {
    return _cloudFirestoreRepository.updateUserDataFirestore(user);
  }

  //4. Agregar comic a favorito
  addFavorite( ComicModel comic){
    if(userActive == null){
      getUserData(idUserActivate);
    }
    userActive!.addFavorite(comic);
    updateUserData(userActive!);
    notifyListeners();

    //TODO: borrar
    userActive!.myFavoriteComics!.forEach((element) {
      print(element.title);
    },);

  }

  //5. Listar favoritos
  get favoriteComics {
    if(userActive == null){
      getUserData(idUserActivate);
    }
    return userActive!.favoriteComics;
  }

  //6. Eliminar de favotiros
  deleteFavorite( String idComic ){
    if(userActive == null){
      getUserData(idUserActivate);
    }
    print('Eliminando favorito');
    userActive!.deleteFavorite(idComic);
    updateUserData(userActive!);
    notifyListeners();


  }

  // 6. Compartir comic





  // cargar usuario
  getUserData( String uid  ) => _cloudFirestoreRepository.getUserDataFirestore(uid)
      .then((userResponse) {
       UserModel userTemp = UserModel.fromMap(userResponse);
       userActive = userTemp;
        return userResponse;
      });



}