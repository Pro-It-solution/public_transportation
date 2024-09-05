import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'theme_color.dart';

class DarkLightTheme with ChangeNotifier {
  // fonts lang
  static String? enFont = GoogleFonts.aBeeZee().fontFamily;
  static String? arFont = GoogleFonts.cairo().fontFamily;

  /// [checkLangFont] return font depended lang
  static String? checkLangFont(BuildContext context) =>
      context.locale == const Locale('en') ? enFont : arFont;

  static ThemeData themeLight(BuildContext context) {
    return ThemeData.light(useMaterial3: true).copyWith(
        colorScheme: const ColorScheme.light(),
        primaryColor: ThemeColor.gold,
        navigationBarTheme:
            NavigationBarThemeData(backgroundColor: ThemeColor.gold),
        appBarTheme: AppBarTheme(
            backgroundColor: ThemeColor.appbar,
            elevation: 5,
            iconTheme: IconThemeData(color: ThemeColor.red)),
        textTheme: Theme.of(context).textTheme.apply(
              displayColor: Colors.black,
              bodyColor: Colors.black,
            ),
        buttonTheme: ButtonThemeData(
            buttonColor: ThemeColor.gold, textTheme: ButtonTextTheme.primary));
  }

  static ThemeData themeDark(BuildContext context) {
    return ThemeData.dark(useMaterial3: true).copyWith(
        navigationBarTheme:
            NavigationBarThemeData(backgroundColor: ThemeColor.gold),
        colorScheme: const ColorScheme.dark(),
        primaryColor: ThemeColor.gold,
        appBarTheme: AppBarTheme(
          backgroundColor: ThemeColor.appbar,
          elevation: 5,
          iconTheme: IconThemeData(color: ThemeColor.green),
        ),
        textTheme: Theme.of(context).textTheme.apply(
              displayColor: Colors.white,
              bodyColor: Colors.white,
            ),
        buttonTheme: ButtonThemeData(
            buttonColor: ThemeColor.gold, textTheme: ButtonTextTheme.primary));
  }

  /// [isDark] check theme when theme dark  return true otherwise false

  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  /// [mainColor] return color depended on theme
  ///
  /// light -> `black`
  ///
  /// dark -> `white`
  static Brightness mainColor(BuildContext context) =>
      DarkLightTheme.isDark(context) ? Brightness.dark : Brightness.light;
  void setDarkLight(BuildContext context) {
    DarkLightTheme.isDark(context)
        ? AdaptiveTheme.of(context).setLight()
        : AdaptiveTheme.of(context).setDark();
    notifyListeners();
  }
}
