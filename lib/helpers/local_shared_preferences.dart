import 'package:shared_preferences/shared_preferences.dart';

class LocalSharedPreferences {
  static String loggedInUserKey = 'isLoggedIn';
  static String loggedInUserName = 'username';
  static String loggedInUserEmail = 'email';

  // save to shared preferences
  static Future<bool> loggedInUserSaved(bool isUserLoggedIn) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return await _prefs.setBool(loggedInUserKey, isUserLoggedIn);
  }

  static Future<bool> saveLoggedInUsername(String username) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return await _prefs.setString(loggedInUserName, username);
  }

  static Future<bool> saveLoggedInUserEmail(String userEmail) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return await _prefs.setString(loggedInUserEmail, userEmail);
  }

  // get from shared preferences
  static Future<bool> getLoggedInUser() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return await _prefs.get(loggedInUserKey);
  }

  static Future<String> getLoggedInUsername() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return await _prefs.getString(loggedInUserName);
  }

  static Future<String> getLoggedInUserEmail() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return await _prefs.getString(loggedInUserEmail);
  }
}
