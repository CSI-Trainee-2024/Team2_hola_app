import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hola_app/themes/colors.dart';

class textTheme {
  textTheme._();

  static TextTheme apptextTheme = TextTheme(
    headlineLarge: GoogleFonts.robotoMono(
      fontSize: 32,
      color: colors.whiteColor,
      fontWeight: FontWeight.bold
    ),
    headlineMedium: GoogleFonts.robotoMono(
      fontSize: 24,
      color: colors.whiteColor,
      fontWeight: FontWeight.w700
    ),
    headlineSmall: GoogleFonts.robotoMono(
      fontSize: 20,
      color: colors.whiteColor,
      fontWeight: FontWeight.w500
    ),
    bodyLarge: GoogleFonts.robotoMono(
      fontSize: 18,
      color: colors.whiteColor,
      fontWeight: FontWeight.w400
    ),
    bodyMedium: GoogleFonts.robotoMono(
      fontSize: 18,
      color: colors.mainColor,
      fontWeight: FontWeight.w400
    ),
    bodySmall: GoogleFonts.robotoMono(
      fontSize: 16,
      color: colors.whiteColor,
      fontWeight: FontWeight.w400
    ),
    labelLarge:  GoogleFonts.robotoMono(
      fontSize: 14,
      color: colors.whiteColor,
      fontWeight: FontWeight.w400
    ),
    );
}
