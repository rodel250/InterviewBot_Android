import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = FlutterSecureStorage();

  Future writeSecureData(String key, dynamic value) async {
    var writeData = await _storage.write(key: key, value: value.toString());
    return writeData;
  }

  Future readSecureData(String key) async {
    var readData = await _storage.read(key: key);
    return readData;
  }

  Future deleteAllSecureData() async {
    var deleteData = await _storage.deleteAll();
    return deleteData;
  }
}
