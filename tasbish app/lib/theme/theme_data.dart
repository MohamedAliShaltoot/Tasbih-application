import 'package:flutter/material.dart';


class AppTheme {
  /// 🌞 **Light Theme**
  static final ThemeData lightTheme = ThemeData(
    primaryTextTheme: const TextTheme(
      bodyMedium: TextStyle(color: Color.fromARGB(255, 229, 235, 227),),
    

    ),
    
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF6C63FF), // Beautiful Indigo
      secondary: Color(0xFFFF8C00), // Orange Accent
      //background: Color(0xFFF7F7F7), // Light Grey Background
     // surface: Colors.white,
     // onPrimary: Colors.white,
      onSecondary: Colors.black,
      //onBackground: Colors.black,
      onSurface: Color.fromARGB(255, 12, 11, 26),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 12, 11, 26), // Same as primary
      elevation: 0,
      //iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
    scaffoldBackgroundColor: const Color(0xFFF7F7F7),
    //textTheme: _textTheme,
  );

  /// 🌙 **Dark Theme**
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFBB86FC), // Soft Purple
      secondary: Color(0xFFFFA726), // Warm Orange
     // background: Color(0xFF121212), // True Black Background
      surface: Color(0xFF1E1E1E), // Darker Surface
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      //onBackground: Colors.white,
     // onSurface: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 10, 55, 117),
      elevation: 3,
     // iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
    scaffoldBackgroundColor: const Color(0xFF121212),
    //textTheme: _textTheme,
  );

  
}
