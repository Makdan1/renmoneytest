import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renmoneytest/utils/colors.dart';

ThemeData buildLightTheme(BuildContext context) {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    buttonColor: Colors.redAccent,
    cardColor: Colors.white,
    textTheme: GoogleFonts.openSansTextTheme(
      Theme.of(context).textTheme,
    ),
    backgroundColor: Colors.white,
    primaryColor: Colors.red,
    accentColor: Colors.redAccent,
    scaffoldBackgroundColor: Colors.white,
  );
}

ThemeData buildDarkTheme(BuildContext context) {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    buttonColor: Colors.blueAccent,
    cardColor: Colors.grey[800],
    textTheme: GoogleFonts.openSansTextTheme(
      Theme.of(context).textTheme,
    ).apply(bodyColor: AppColors.white),
    backgroundColor: Colors.grey[800],
    primaryColor: Colors.blue[900],
    accentColor: Colors.blueAccent,
    scaffoldBackgroundColor: Colors.grey[900],
  );
}