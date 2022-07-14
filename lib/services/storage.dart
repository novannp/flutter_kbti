import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = const FlutterSecureStorage();
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  Future write(key, value) async {
    var write = await _storage.write(
        key: key, value: value, aOptions: _getAndroidOptions());
    return write;
  }

  Future read(key) async {
    var read = await _storage.read(key: key, aOptions: _getAndroidOptions());
    return read;
  }

  Future delete(key) async {
    var delete =
        await _storage.delete(key: key, aOptions: _getAndroidOptions());
    return delete;
  }
}
