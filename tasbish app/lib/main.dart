import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_screen.dart';


//import 'package:flutter_application_1/splash_screen.dart';
import 'package:flutter_application_1/theme/theme_data.dart';


void main() {
  runApp(const TasbishApp());
}

class TasbishApp extends StatefulWidget {
  const TasbishApp({super.key});

  @override
  State<TasbishApp> createState() => _TasbishAppState();
}

class _TasbishAppState extends State<TasbishApp> {

ThemeMode _themeMode = ThemeMode.dark;

void _toggleTheme() {
  setState(() {
    _themeMode = _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
  });
}



  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      home: HomeScreen( onToggle: _toggleTheme,),
    );
  }
}
