import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooderlichTheme {
  static final _lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );
  static final _darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorSchemeSeed: Colors.purpleAccent,
      textTheme: _lightTextTheme,
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.purpleAccent.withOpacity(0.3),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.purpleAccent.withOpacity(0.8),
        centerTitle: true,
        elevation: 0,
        //color: Colors.transparent,
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.deepPurpleAccent,
      brightness: Brightness.dark,
      textTheme: _darkTextTheme,
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Colors.transparent,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black.withOpacity(0.1),
        centerTitle: true,
        elevation: 0,
        //color: Colors.transparent,
      ),
    );
  }
}
