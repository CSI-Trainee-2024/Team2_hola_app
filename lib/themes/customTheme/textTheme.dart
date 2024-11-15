import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hola_app/themes/colors.dart';

class textTheme {
  textTheme._();

  static TextTheme apptextTheme = TextTheme(
    headlineLarge: GoogleFonts.roboto(
      fontSize: 32,
      color: colors.whiteColor,
      fontWeight: FontWeight.bold
    ),
    headlineMedium: GoogleFonts.roboto(
      fontSize: 24,
      color: colors.whiteColor,
      fontWeight: FontWeight.w700
    ),
    headlineSmall: GoogleFonts.roboto(
      fontSize: 20,
      color: colors.whiteColor,
      fontWeight: FontWeight.w500
    ),
    bodyLarge: GoogleFonts.roboto(
      fontSize: 18,
      color: colors.whiteColor,
      fontWeight: FontWeight.w400
    ),
    bodyMedium: GoogleFonts.roboto(
      fontSize: 18,
      color: colors.mainColor,
      fontWeight: FontWeight.w400
    ),
    bodySmall: GoogleFonts.roboto(
      fontSize: 16,
      color: colors.whiteColor,
      fontWeight: FontWeight.w400
    ),
    labelLarge:  GoogleFonts.roboto(
      fontSize: 14,
      color: colors.whiteColor,
      fontWeight: FontWeight.w400
    ),
    );
}
