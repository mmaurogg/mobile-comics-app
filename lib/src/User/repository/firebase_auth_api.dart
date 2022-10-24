import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential> signIn() async {

    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

    if(googleSignInAccount != null){
      GoogleSignInAuthentication? gSA = await googleSignInAccount.authentication;

      UserCredential user = await _auth.signInWithCredential(
          GoogleAuthProvider.credential( idToken: gSA.idToken, accessToken: gSA.accessToken)
      );
      return user;

    } else {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication? gSA = await googleSignInAccount?.authentication;

      UserCredential user = await _auth.signInWithCredential(
          GoogleAuthProvider.credential( idToken: gSA?.idToken, accessToken: gSA?.accessToken)
      );


      return user;
    }


  }

  void signOut() async {
    await _auth.signOut().then((_) => print('Sesion cerrada'));
    _googleSignIn.signOut();
    print('Todas las sesiones se han cerrado');
  }


}