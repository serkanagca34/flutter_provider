import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  SharedPreferences? _prefs;

  Cache();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void setString(String key, String value) {
    _prefs?.setString(key, value);
  }

  String? getString(String key) {
    return _prefs?.getString(key);
  }

  void clear() {
    _prefs?.clear();
  }
}
