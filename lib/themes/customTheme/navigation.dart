import 'package:flutter/material.dart';
import 'package:hola_app/themes/colors.dart';

class navigationTheme {
  navigationTheme._();

  static const navigationThemeData = BottomNavigationBarThemeData(
      backgroundColor: colors.transparent,
      unselectedIconTheme: IconThemeData(size: 35, color: colors.whiteColor),
      selectedIconTheme: IconThemeData(size: 40, color: colors.buttonColor),
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false);
}
