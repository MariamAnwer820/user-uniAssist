import 'package:admin_interface22/services/cache_services.dart';
import 'package:admin_interface22/screens/cons.dart';
import 'package:flutter/material.dart';
import 'package:admin_interface22/compontent/theme.dart';

class themeprovider with ChangeNotifier {
  ThemeData _themeData = is_dark ? darkMode : LightMode;
  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }
 
  void toggoletheme() {
    is_dark = !is_dark;
    if (_themeData == LightMode) {
      themeData = darkMode;
    } else {
      themeData = LightMode;
    }
    CacheService.saveData(key: "is_dark", value: is_dark);
  }
}
