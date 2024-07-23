import 'package:flutter/material.dart';

ThemeData LightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme:  ColorScheme.light(
        primary: Color(0xFFE5E5E5),
        secondary: Colors.black,
        surface: Colors.white,
       ));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme:  ColorScheme.dark(
        primary: Color(0xFF707070),
        secondary: Colors.white,
        surface: Color(0xFF353535),
       ));
