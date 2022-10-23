import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../model/user.dart';
import '../repository/cloud_firebase_repository.dart';
import '../repository/fire_auth_repository.dart';


class UserBloc extends ChangeNotifier {
  final _authRepository = AuthRepository();
  final _cloudFirestoreRepository = CloudFirestoreRepository();

  Stream<User?> streeamFirebase = FirebaseAuth.instance.authStateChanges();

  Stream<User?> get authStatus => streeamFirebase;

  //Casos de uso (el block contiene la logica del negocio)

  //1. SignIn a la palicación con Google
  Future<UserCredential> signIn() {
    return _authRepository.signInFirebase();
  }

  //2. SignOut de la aplicación
  signOut() {
    _authRepository.signOut();
  }

  //3. Registrar usuario en BD
  void updateUserData(UserModel user) =>
      _cloudFirestoreRepository.updateUserDataFirestore(user);



}