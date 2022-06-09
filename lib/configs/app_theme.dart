import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
var isDarkTheme = true;

final ThemeData appThemeData = ThemeData(
  primarySwatch: Colors.red,
  primaryColor: isDarkTheme ? Colors.black : Colors.white,

  backgroundColor: isDarkTheme ? Colors.black : const Color(0xffF1F5FB),
);
