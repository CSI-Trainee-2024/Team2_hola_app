import 'package:flutter/material.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class elevatedButton {
  elevatedButton._();

  static ElevatedButtonThemeData elevatedButtonTheme =
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.buttonColor,
          foregroundColor: colors.whiteColor,
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: colors.borderColor,
              width: 1.0
            )
          ),
          textStyle: textTheme.apptextTheme.headlineMedium,
          //padding: EdgeInsets.symmetric()
        )
      );
}
