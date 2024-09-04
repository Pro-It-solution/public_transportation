// ignore_for_file: unused_element, non_constant_identifier_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_app00/theme/dark_light_theme.dart';
import 'package:new_app00/theme/theme_color.dart';

class WSnackBar {
  // Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar .
  static void snack(BuildContext context, String content) {
    dynamic showSnackBar(
        dynamic Function({dynamic backgroundColor, dynamic content})
            SnackBars) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text(content.tr(), style: const TextStyle(color: Colors.white)),
          backgroundColor: DarkLightTheme.isDark(context)
              ? ThemeColor.green
              : ThemeColor.red,
        ),
      );
      showSnackBar(({backgroundColor, content}) => null);
    }
  }
}
