import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static late SharedPreferences prefs;

  static Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future setlattosharedpref(String lat) async {
    await prefs.setString("lattitude", lat);
  }

  static Future setlongitosharedpref(String longitude) async {
    await prefs.setString("longitude", longitude);
  }

  static String? getlat() {
    return prefs.getString("lattitude");
  }

  static String? getlongi() {
    return prefs.getString("longitude");
  }
}
