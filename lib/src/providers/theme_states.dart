import 'package:flutter/material.dart';

class ThemeState with ChangeNotifier {
  bool _isModeDarkEnabled = false;

  ThemeData get currentTheme =>
      _isModeDarkEnabled ? ThemeData.dark() : ThemeData.light();

  bool get isDarkEnabled => _isModeDarkEnabled;

  void setDarkModel(bool b) {
    _isModeDarkEnabled = b;
    notifyListeners();
  }
}
