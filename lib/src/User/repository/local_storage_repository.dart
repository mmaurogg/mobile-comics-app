import 'local_storage_api.dart';


class LocalStorageRepository {
  final _localStorageAPI = LocalStorageAPI();

  addToStorage( String key, String value ) async => _localStorageAPI.addToStorage(key, value);

  readOfStorage( String key ) async => _localStorageAPI.readOfStorage(key);

  deleteOfStorage( String key ) async => _localStorageAPI.deleteOfStorage(key);

}