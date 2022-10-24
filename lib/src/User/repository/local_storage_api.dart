

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageAPI {
  final storage = FlutterSecureStorage();

  addToStorage( String key, String value ) async {
    return await storage.write(key: key, value: value);
  }

  readOfStorage( String key ) async {
    return await storage.read(key: key) ?? '';
  }

  deleteOfStorage( String key ) async {
    return await storage.delete(key: key);
  }
}




