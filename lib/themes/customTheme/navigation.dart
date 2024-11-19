import 'package:flutter/material.dart';
import 'package:hola_app/themes/colors.dart';

class navigationTheme {
  navigationTheme._();

  static const navigationThemeData = BottomNavigationBarThemeData(
    backgroundColor: colors.transparent,
    unselectedIconTheme: IconThemeData(
      size: 30,
      color: colors.whiteColor
    ),
    selectedIconTheme: IconThemeData(
      size: 40,
      color: colors.buttonColor
    ),
    type: BottomNavigationBarType.fixed
  );
}
