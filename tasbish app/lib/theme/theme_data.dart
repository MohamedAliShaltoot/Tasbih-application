import 'package:flutter/material.dart';

class AppTheme {
  /// 🌞 **Light Theme**
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color.fromARGB(45, 171, 8, 8), // لون الأزرار الرئيسية في الوضع الفاتح
    scaffoldBackgroundColor:
        const Color.fromARGB(255, 4, 57, 82), // خلفية التطبيق في الوضع الفاتح
    appBarTheme: const AppBarTheme(
      backgroundColor:
          Color.fromARGB(255, 66, 95, 175), // لون الـ AppBar في الوضع الفاتح
      elevation: 0,
      iconTheme:
          IconThemeData(color: Color.fromARGB(255, 17, 17, 17)), // لون الأيقونات في الوضع الفاتح
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.white, // لون الأزرار الرئيسية في الوضع الفاتح
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
            color: Colors.white), // لون حدود الأزرار في الوضع الفاتح
      ),
    ),
    iconTheme: const IconThemeData(
        color: Colors.white), // لون الأيقونات في الوضع الفاتح
  );

  /// 🌙 **Dark Theme**
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    // primaryColor: const Color.fromARGB(
    //     255, 181, 17, 17), // لون الأزرار الرئيسية في الوضع الداكن
    scaffoldBackgroundColor:
        const Color.fromARGB(255, 2, 66, 78), // خلفية التطبيق في الوضع الداكن
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 1, 3, 2), // لون الـ AppBar في الوضع الداكن
      elevation: 0,
      iconTheme:
          IconThemeData(color: Color.fromARGB(255, 240, 238, 238)), // لون الأيقونات في الوضع الداكن
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.black, // لون الأزرار الرئيسية في الوضع الداكن
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
            color: Color.fromARGB(255, 20, 20, 20)), // لون حدود الأزرار في الوضع الداكن
      ),
    ),
    // iconTheme: const IconThemeData(
    //     color: Colors.black), // لون الأيقونات في الوضع الداكن
  );
}
