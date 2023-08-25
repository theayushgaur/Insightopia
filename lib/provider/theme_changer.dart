import 'package:expense_app/themes/dark_theme.dart';
import 'package:flutter/material.dart';

import '../themes/light_theme.dart';

class ThemeChanger with ChangeNotifier {
  var _themeData = lightTheme;
  ThemeData get thememode => _themeData;
  void setTheme(thememode) {
    _themeData = thememode;
    notifyListeners();
  }
}
