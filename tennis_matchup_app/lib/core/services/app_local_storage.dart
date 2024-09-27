
import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static late SharedPreferences pref;
  static init() async {
    pref = await SharedPreferences.getInstance();
  }

  // write data
  static cacheData(key, value) {
    if (value is int) {
      pref.setInt(key, value);
    } else if (value is String) {
      pref.setString(key, value);
    } else if (value is double) {
      pref.setDouble(key, value);
    } else {
      pref.setBool(key, value);
    }
  }

  // read date
  static getCacheData(key) {
    return pref.get(key);
  }
}
