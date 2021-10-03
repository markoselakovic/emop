import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';



///supports
///int, bool, string at the moment!
class EmopSharedPreferences {
  factory EmopSharedPreferences() {
    _singleton ??= EmopSharedPreferences._internal();

    return _singleton;
  }

  EmopSharedPreferences._internal() {
    SharedPreferences.getInstance()
        .then((SharedPreferences fetchedSharedPreferences) {
      sharedPreferences = fetchedSharedPreferences;
    });
  }

  static EmopSharedPreferences _singleton;

  SharedPreferences sharedPreferences;

  static EmopSharedPreferences getInstance() {
    return _singleton;
  }

  bool getBool(String key) {
    return _singleton?.sharedPreferences?.getBool(key) ?? false;
  }

  void setBool({@required String key, @required bool value}) {
    _singleton?.sharedPreferences?.setBool(key, value);
  }

  int getInt(String key) {
    return _singleton?.sharedPreferences?.getInt(key) ?? 0;
  }

  void setInt({@required String key, @required int value}) {
    _singleton?.sharedPreferences?.setInt(key, value);
  }

  String getString(String key) {
    return _singleton?.sharedPreferences?.getString(key) ?? '';
  }

  void setString({@required String key, @required String value}) {
    _singleton?.sharedPreferences?.setString(key, value);
  }

  void removeKey(String key) {
    _singleton?.sharedPreferences?.remove(key);
  }
}
