
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_app00/model/dimensions.dart';
import 'package:new_app00/theme/dark_light_theme.dart';
import 'package:new_app00/theme/theme_color.dart';

class WidgetToast {
  /// [buildToast] show toast custom
  static buildToast({
    required BuildContext context,
    required String msg,
    bool translation = true,
  }) async {
    return await Fluttertoast.showToast(
      msg: translation ? msg.tr() : msg,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: DarkLightTheme.isDark(context)
          ? ThemeColor.purple
          : ThemeColor.blueMagenta,
      textColor: ThemeColor.white,
      fontSize: MDime.l.sp,
    );
  }
}
