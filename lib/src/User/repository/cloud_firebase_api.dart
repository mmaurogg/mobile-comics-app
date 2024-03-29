import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comic_app/src/User/model/user.dart';

class CloudFirestoreAPI {
  final CollectionReference dbUsers =
      FirebaseFirestore.instance.collection("users");

  Future<void> updateUserData(UserModel user) async {
    DocumentReference ref = dbUsers.doc(user.uid);

    print('Updating');

    return ref.set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myFavoriteComics':
          List<dynamic>.from(user.myFavoriteComics!.map((x) => x.toMap())),
      'lastSignIn': DateTime.now()
    }, SetOptions(merge: true));
  }

  Future getUserData(String uid) async {
    final resp = await dbUsers.doc(uid).get();
    print('respuesta!! ');
    print(resp);
    return resp.data();
  }
}
