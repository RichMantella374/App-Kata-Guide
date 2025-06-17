import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  static final StorageService _instance = StorageService._internal();
  final FlutterSecureStorage _secureStorage;

  factory StorageService() {
    return _instance;
  }

  StorageService._internal() : _secureStorage = const FlutterSecureStorage();

  // Secure storage methods
  Future<void> saveSecure(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> getSecure(String key) async {
    return await _secureStorage.read(key: key);
  }

  Future<void> deleteSecure(String key) async {
    await _secureStorage.delete(key: key);
  }

  Future<void> clearSecure() async {
    await _secureStorage.deleteAll();
  }

  // Keys
  static const String supabaseSessionKey = 'supabase_session';
  static const String userEmailKey = 'user_email';
}
