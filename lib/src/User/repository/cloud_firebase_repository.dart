import '../model/user.dart';
import 'cloud_firebase_api.dart';

class CloudFirestoreRepository {

  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(UserModel user) async => _cloudFirestoreAPI.updateUserData(user);



}