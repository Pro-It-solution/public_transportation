
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_app00/constants/localization.dart';
import 'package:new_app00/theme/dark_light_theme.dart';
import 'package:new_app00/theme/text_style.dart';
import 'package:new_app00/theme/theme_color.dart';

class WidgetSearchField extends StatelessWidget {
  const WidgetSearchField({super.key, required this.onChanged});
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    //textfield for search
    return TextFormField(
        style: ThemeTextStyle.bLarge(context)?.copyWith(color: Colors.black),
        cursorColor:
            DarkLightTheme.isDark(context) ? ThemeColor.green : ThemeColor.red,
        decoration: InputDecoration(
          hintText: ConstantLocalization.search.tr(),
          focusColor: ThemeColor.black,
          hoverColor: ThemeColor.black,
          border: InputBorder.none,
        ),
        onChanged: onChanged);
  }
}
