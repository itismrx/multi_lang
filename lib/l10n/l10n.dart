import 'package:flutter/material.dart';

class L10n {
  static final all = [const Locale('en'), const Locale('am')];
  static String getFlag(String code) {
    switch (code) {
      case 'am':
        return "🇪🇹";
      default:
        return "🇺🇸";
    }
  }
}
