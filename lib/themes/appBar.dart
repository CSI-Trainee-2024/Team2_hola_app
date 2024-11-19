import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class appBarTheme {
  appBarTheme._();

  static final appBarThemeData = AppBarTheme(
    actionsIconTheme: const IconThemeData(
      color: colors.mainColor,
      size: 30,
    ),
    foregroundColor: colors.whiteColor,
    backgroundColor: colors.transparent,
    elevation: 0,
    titleTextStyle:textTheme.apptextTheme.headlineSmall
  );
}
