import 'package:flutter/material.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class textField {
  textField._();

  static InputDecorationTheme textFieldTheme = InputDecorationTheme(
    prefixIconColor: colors.mainColor,
    suffixIconColor: colors.whiteColor,
    hintStyle: textTheme.apptextTheme.bodyLarge,
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(width: 2,color: colors.whiteColor)
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(width: 2,color: colors.buttonColor)
    ),
    errorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(width: 2,color: colors.redColor)
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(width: 2,color: colors.buttonColor)
    ),
  );
}
