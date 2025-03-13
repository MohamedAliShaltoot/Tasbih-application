import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class LocalizationService {
  static Locale currentLocale = const Locale('en');

  static Future<void> loadSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString('language_code');
    if (languageCode != null) {
      currentLocale = Locale(languageCode);
    }
  }

  static void changeLocale(Locale newLocale) async {
    currentLocale = newLocale;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', newLocale.languageCode);
  }

  static String translate(String key, [Map<String, dynamic>? args]) {
    final localizedStrings = {
      'en': {
        'appTitle': 'Tasbiha',
        'subhanAllah': 'Subhan Allah',
        'alhamdulillah': 'Alhamdulillah',
        'laIlahaIllallah': 'La Ilaha Illallah',
        'allahuAkbar': 'Allahu Akbar',
        'congratulations': '🎉 Congratulations!',
        'reachCount': 'You reached {value} in {text}',
        'continue': 'Continue',
        'reset': 'Reset ',
        'toggleLanguage': 'Change Language',
        "welcome": "Welcome",
        "welcomeMessage": "Wlecome to Tasbiha, Please tap on the start button to start the app",
      },
      'ar': {
        'appTitle': 'تسبيحة',
        'subhanAllah': 'سبحان الله',
        'alhamdulillah': 'الحمد لله',
        'laIlahaIllallah': 'لا إله إلا الله',
        'allahuAkbar': 'الله أكبر',
        'congratulations': '🎉 تهانينا!',
        'reachCount': 'لقد وصلت إلى {value} من {text}',
        'continue': 'متابعة',
        'reset': 'تصفير',
        'toggleLanguage': 'تغيير اللغة',
        "welcome": "مرحبا",
        "welcomeMessage":
            "مرحبا بك في التسبيحة، يرجى الضغط على زر التشغيل لبدء التطبيق",
      }
    };

    String locale = currentLocale.languageCode;
    String? translatedText = localizedStrings[locale]?[key] ?? key;

    if (args != null) {
      args.forEach((key, value) {
        translatedText = translatedText!.replaceAll('{$key}', value.toString());
      });
    }

    return translatedText!;
  }
}
