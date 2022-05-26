import 'package:flutter/material.dart';

class LocalizationConfig {
  static const supportedLocales = [
    Locale('en'),
    Locale('zh'),
  ];

  static const fallbackLocale = Locale('en');

  static const path = 'assets/translations';
}
