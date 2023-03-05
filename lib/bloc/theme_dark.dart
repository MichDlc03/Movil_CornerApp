import 'package:shared_preferences/shared_preferences.dart';

class ThemePreference {
  static const themeMode = "Mode";
  static const dark = " d";
  static const light = " Light";

  setModeTheme(String theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(themeMode, theme);
  }

  Future<String> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(themeMode) ?? light;
  }
}
