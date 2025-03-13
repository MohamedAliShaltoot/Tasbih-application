import 'package:flutter/material.dart';

class LocalizationService {
  static Locale currentLocale = const Locale('en');

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appTitle': 'Tasbiha',
      'counterText': 'Counter: ',
      'resetButton': 'Reset',
    },
    'ar': {
      'appTitle': 'تسبيحة',
      'counterText': 'العداد: ',
      'resetButton': 'إعادة التصفير',
    },
  };

  static String translate(String key, Map<String, Object> map) {
    return _localizedValues[currentLocale.languageCode]?[key] ?? key;
  }

  static void changeLocale(Locale locale) {
    currentLocale = locale;
  }
}
