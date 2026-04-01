import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferencesService({SharedPreferencesAsync? prefs})
    : _prefs = prefs ?? SharedPreferencesAsync();

  final SharedPreferencesAsync _prefs;

  Future<void> setString({required String key, required String value}) {
    return _prefs.setString(key, value);
  }

  Future<String?> getString(String key) {
    return _prefs.getString(key);
  }

  Future<void> setBool({required String key, required bool value}) {
    return _prefs.setBool(key, value);
  }

  Future<bool?> getBool(String key) {
    return _prefs.getBool(key);
  }

  Future<void> setInt({required String key, required int value}) {
    return _prefs.setInt(key, value);
  }

  Future<int?> getInt(String key) {
    return _prefs.getInt(key);
  }

  Future<void> setDouble({required String key, required double value}) {
    return _prefs.setDouble(key, value);
  }

  Future<double?> getDouble(String key) {
    return _prefs.getDouble(key);
  }

  Future<void> setStringList({
    required String key,
    required List<String> value,
  }) {
    return _prefs.setStringList(key, value);
  }

  Future<List<String>?> getStringList(String key) {
    return _prefs.getStringList(key);
  }

  Future<void> remove(String key) {
    return _prefs.remove(key);
  }

  Future<void> clear() {
    return _prefs.clear();
  }

  Future<bool> containsKey(String key) {
    return _prefs.containsKey(key);
  }
}
