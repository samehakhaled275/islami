import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  String currentLang = 'en';

  void changeLocale(String newLocal) {
    currentLang = newLocal;
    notifyListeners();
  }

  void changeTheme(ThemeMode newMode) {
    currentTheme = newMode;
    notifyListeners();
  }

  String getMainBackgroundImage() {
    return currentTheme == ThemeMode.light
        ? 'assets/images/main_background.png'
        : 'assets/images/main_background_dark.png';
  }

  bool isDarkMode() {
    return currentTheme == ThemeMode.dark;
  }
}
