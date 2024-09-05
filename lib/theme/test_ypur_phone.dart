import 'package:flutter/material.dart';

class ThemeTestphone {
  static bool isIos(BuildContext context) {
    return (Theme.of(context).platform == TargetPlatform.iOS);
  }
}
