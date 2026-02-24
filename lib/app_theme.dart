import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primaryPurple = Color(0xFF6F51B0); // Primary brand color
  static const Color accentPink = Color(0xFFED519E);    // Secondary/Action color
  static const Color darkText = Color(0xFF3F3D56);      // Main heading color
  static const Color purpleText = Color(0xFF4B397F);
  static const Color lightGray = Color(0xFFF2F2F2);     // Background for input fields
  static const Color fieldPurple = Color(0xFF8E7BB5);
}

/// AppTheme: Defines the global look and feel of the application.
class AppTheme {
  static ThemeData get light { // Getter for the light theme 
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      textTheme: GoogleFonts.poppinsTextTheme(), 
      primaryTextTheme: GoogleFonts.poppinsTextTheme(), //*

      elevatedButtonTheme: ElevatedButtonThemeData( // elevatedButtonTheme: Automatically applies these styles to all ElevatedButtons
        style: ElevatedButton.styleFrom(
          elevation: 0, // Removes the shadow 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          // Sets the default text size and weight for all button labels
          textStyle: const TextStyle(
            fontSize: 18, 
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}