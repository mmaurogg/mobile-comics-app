import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:comic_app/src/User/repository/firebase_auth_api.dart';


class AuthRepository {
  final _firebaseAuthAPI = FirebaseAuthAPI();

  Future<UserCredential> signInFirebase() async => _firebaseAuthAPI.signIn();

  signOut() => _firebaseAuthAPI.signOut();

}