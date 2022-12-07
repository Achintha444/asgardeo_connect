import "package:flutter/material.dart";

/// Theme data for the project
ThemeData themeData = ThemeData(
  primarySwatch: Colors.orange,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.black87),
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
          fontSize: 14,
          letterSpacing: 1,
          fontWeight: FontWeight.w500
        ),
      ),
  
    ),
  ),
  appBarTheme: const AppBarTheme(
    color:Colors.white70,
    foregroundColor: Colors.black87,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w700,
      color: Colors.black87,
      fontSize: 18
    )
  )
);
