import 'package:flutter/material.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class searchbar {
  searchbar._();

  static SearchBarThemeData searchBarThemeData = SearchBarThemeData(
    backgroundColor: const WidgetStatePropertyAll(colors.greyColor),
    shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    )),
    hintStyle: WidgetStatePropertyAll(textTheme.apptextTheme.bodySmall),
    textStyle: WidgetStatePropertyAll(textTheme.apptextTheme.bodySmall),
    padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 15, vertical: 5)),
  );
}
