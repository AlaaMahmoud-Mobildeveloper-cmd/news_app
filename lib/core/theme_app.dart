import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeData{
  static ThemeData themeLight = ThemeData(

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),
   colorScheme: ColorScheme(
     brightness: Brightness.light,
     primary: Color(0xFFFFFFFF),
     onPrimary: Color(0xFF171717),
     secondary: Color(0xFF4A90E2),
     onSecondary: Color(0xFFFFFFFF),
     error: Color(0xFFB00020),
     onError: Color(0xFFFFFFFF),
     surface: Color(0xFFF5F5F5),
     onSurface: Color(0xFF1A1A1A),
   ),
    textTheme: TextTheme(
      titleLarge:GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Color(0xFF171717),
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Color(0xFF171717),
      ),
      titleSmall: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Color(0xFF171717),
      )
    )
  );
  static ThemeData themeDark = ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF171717),
      onPrimary:Color(0xFFFFFFFF),
      secondary: Color(0xFF4A90E2),
      onSecondary: Color(0xFFFFFFFF),
      error: Color(0xFFCF6679),
      onError: Color(0xFF000000),
      surface: Color(0xFF1E1E1E),
      onSurface: Color(0xFFE0E0E0),
    ),
      textTheme: TextTheme(
          titleLarge:GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(0xFF171717),
          ),
          titleMedium: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF171717),
          ),
          titleSmall: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF171717),
          )
      )
  );
}