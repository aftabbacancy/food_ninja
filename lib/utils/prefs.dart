import 'package:shared_preferences/shared_preferences.dart';

class PrefKeys {
  static const String userId = 'userid';
  static const String userName = 'username';
  static const String userEmail = 'email';
}

class Prefs {
  setStringPrefs(key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  getStringPrefs(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString(key);
    return stringValue;
  }
}
