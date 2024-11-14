import 'package:flutter/material.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData themeData = ThemeData(
    textTheme: textTheme.apptextTheme
  );
}
