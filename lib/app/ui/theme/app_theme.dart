import 'package:flutter/material.dart';
import 'package:salon_app/app/ui/theme/app_colors.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: primaryColor,
  accentColor: primaryColor.withOpacity(0.5),
  backgroundColor: whiteColor,

  // splashColor: Colors.purpleAccent,
  // highlightColor: Colors.purple,
  fontFamily: 'Georgia',
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
  ),
);

final ThemeData appThemeDatadark = ThemeData(
  primaryColor: primaryColor,
  accentColor: primaryColor.withOpacity(0.5),
  backgroundColor: blackColor,
  brightness: Brightness.dark,
  // splashColor: Colors.purpleAccent,
  // highlightColor: Colors.purple,
  fontFamily: 'Georgia',
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
  ),
);
