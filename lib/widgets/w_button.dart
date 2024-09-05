import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_app00/model/dimensions.dart';
import 'package:new_app00/theme/text_style.dart';
import 'package:new_app00/theme/theme_color.dart';

class WidgetBtn extends StatelessWidget {
  const WidgetBtn({
    super.key,
    required this.title,
    required this.onTap,
    this.height,
    this.margin,
  });
  final double? height;
  final EdgeInsets? margin;
  final String title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        width: MDime.fullScreen.sw,
        height: (height ?? (MDime.xl * MDime.d2)).h,
        padding: EdgeInsets.zero,
        // margin: margin,
        // alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
            // stops: [0.5, 0.5],
            colors: ThemeColor.btnAuth,
          ),
          borderRadius: BorderRadius.circular(MDime.md.r),
        ),
        child: Align(
          alignment: AlignmentDirectional.center,
          child: Text(
            title.tr().toUpperCase(),
            textAlign: TextAlign.center,
            style: ThemeTextStyle.hSmall(context)?.copyWith(
              color: ThemeColor.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
