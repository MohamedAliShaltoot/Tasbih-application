// import 'package:Tasbiha/Comments/update.dart';
// import 'package:Tasbiha/home_screen.dart';
// import 'package:Tasbiha/theme/theme_data.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const TasbishApp());
// }

// class TasbishApp extends StatefulWidget {
//   const TasbishApp({super.key});

//   @override
//   State<TasbishApp> createState() => _TasbishAppState();
// }

// class _TasbishAppState extends State<TasbishApp> {
//   ThemeMode _themeMode = ThemeMode.dark;

//   void _toggleTheme() {
//     setState(() {
//       _themeMode =
//           _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       darkTheme: AppTheme.darkTheme,
//       theme: AppTheme.lightTheme,
//       themeMode: _themeMode,
//       debugShowCheckedModeBanner: false,
//       home:

//           //HomeScreen3()

//           HomeScreen(
//         onToggle: _toggleTheme,
//         onToggleLocale: () {},
//       ),
//     );
//   }
// }


import 'package:Tasbiha/localization.dart';
import 'package:Tasbiha/theme/theme_data.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalizationService.loadSavedLocale();
  runApp(const TasbihaApp());
}

class TasbihaApp extends StatefulWidget {
  const TasbihaApp({super.key});

  @override
  State<TasbihaApp> createState() => _TasbihaAppState();
}

class _TasbihaAppState extends State<TasbihaApp> {
    ThemeMode _themeMode = ThemeMode.dark;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }
  void _toggleLanguage() async {
    Locale newLocale = LocalizationService.currentLocale.languageCode == 'en'
        ? const Locale('ar')
        : const Locale('en');

    setState(() {
      LocalizationService.changeLocale(newLocale);
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', newLocale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      themeMode: _themeMode,
      title: LocalizationService.translate('appTitle'),
      debugShowCheckedModeBanner: false,
      locale: LocalizationService.currentLocale,
      supportedLocales: const [Locale('en'), Locale('ar')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: HomeScreen(onToggleLanguage: _toggleLanguage, onToggleLocale: () {  }, onToggleTheme: _toggleTheme,),
    );
  }
}
