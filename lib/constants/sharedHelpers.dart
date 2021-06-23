import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class sharedHelpers {
  Future<dynamic> getSharedPreferenceValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<dynamic> saveSharedPreferencesValue(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }
}
