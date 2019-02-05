import 'package:shared_preferences/shared_preferences.dart';

class UserPrefs {
  //theme name to be stored in shared prefs
  static const String THEME = "theme";

  SharedPreferences _prefs;

  void saveTheme(String themename) async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.setString(THEME, themename);
  }

  Future<String> getTheme() async {
    _prefs = await SharedPreferences.getInstance();
    String name = _prefs.getString(THEME);
    return name;
  }
}
