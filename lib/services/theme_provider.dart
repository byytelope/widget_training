import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";

class ThemeProvider extends ChangeNotifier {
  static final _sharedPreferences = SharedPreferencesAsync();
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode value) {
    _themeMode = value;
    _sharedPreferences.setInt("themeMode", value.index);
    notifyListeners();
  }

  ThemeProvider() {
    getThemeAtInit();
  }

  Future<void> getThemeAtInit() async {
    final themeModeValue = await _sharedPreferences.getInt("themeMode");
    _themeMode = ThemeMode.values[themeModeValue ?? 0];
    notifyListeners();
  }
}
