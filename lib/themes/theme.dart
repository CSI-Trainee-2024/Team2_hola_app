import 'package:flutter/material.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/themes/customTheme/elevatedButton.dart';
import 'package:hola_app/themes/customTheme/navigation.dart';
import 'package:hola_app/themes/customTheme/textField.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData themeData = ThemeData(
      scaffoldBackgroundColor: colors.blackColor,
      useMaterial3: true,
      textTheme: textTheme.apptextTheme,
      inputDecorationTheme: textField.textFieldTheme,
      elevatedButtonTheme: elevatedButton.elevatedButtonTheme,
      bottomNavigationBarTheme: navigationTheme.navigationThemeData);
}
