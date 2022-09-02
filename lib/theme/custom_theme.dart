//Custom light and dark theme.
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.blueGrey[50],
      primaryColor: Colors.blue[900],
      dividerColor: Colors.transparent,
      primarySwatch: Colors.indigo,
      fontFamily: "NRT",
      useMaterial3: false,
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          // labelStyle: const TextStyle(color: Colors.grey),
          hoverColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.blue[900]!))),
      cardTheme: CardTheme(
        elevation: 0,
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.zero,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(5),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      buttonTheme:
          ButtonThemeData(materialTapTargetSize: MaterialTapTargetSize.padded),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(5),
          elevation: 0,
          backgroundColor: Colors.indigo[50],
          tapTargetSize: MaterialTapTargetSize.padded,
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      dividerTheme: const DividerThemeData(thickness: 1, space: 10),
    );
  }
}
