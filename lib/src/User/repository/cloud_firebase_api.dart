import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user.dart';

class CloudFirestoreAPI{

  final String USERS = "users";

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> updateUserData(UserModel user) async{
    CollectionReference users = _db.collection(USERS);
    DocumentReference ref = users.doc(user.uid);

    return ref.set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myFavoriteComics': user.myFavoriteComics,
      'lastSignIn': DateTime.now()
    }, SetOptions(merge: true));
  }
}