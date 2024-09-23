import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final prefsServiceProvider = Provider<PrefsService>((ref) {
  return PrefsService();
});

class PrefsService {
  Future<SharedPreferences> _sharedPrefs() async {
    return SharedPreferences.getInstance();
  }

 Future<void> saveInt(String key, int value) async {
    final prefs = await _sharedPrefs();
    await prefs.setInt(key, value);
  }

  Future<void> setBool(String key, bool value) async {
    final prefs = await _sharedPrefs();
    await prefs.setBool(key, value);
  }

  Future<bool?> getBool(String key) async {
    final prefs = await _sharedPrefs();
    return prefs.getBool(key);
  }

  Future<int?> getInt(String key) async {
    final prefs = await _sharedPrefs();
    return prefs.getInt(key);
  }
}
