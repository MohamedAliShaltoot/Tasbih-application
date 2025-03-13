import 'package:Tasbiha/Comments/update.dart';
import 'package:Tasbiha/home_screen.dart';
import 'package:Tasbiha/theme/theme_data.dart';
import 'package:flutter/material.dart';

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
      _themeMode =
          _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      home:

          //HomeScreen3()

          HomeScreen(
        onToggle: _toggleTheme,
        onToggleLocale: () {},
      ),
    );
  }
}
