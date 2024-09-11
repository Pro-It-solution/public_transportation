import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_app00/controller/controller_image.dart';
import 'package:new_app00/model/dimensions.dart';
import 'package:new_app00/theme/dark_light_theme.dart';
import 'package:new_app00/theme/theme_color.dart';
import 'package:new_app00/widgets/w_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../constants/localization.dart';
import '../model/pictures.dart';
import 'w_image_auth.dart';

class WidgetImage extends StatelessWidget {
  const WidgetImage({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerImage authImage =
        Provider.of<ControllerImage>(context, listen: false);
    return InkWell(
      borderRadius: BorderRadius.circular(MDime.xxl.w),
      onTap: () {
        authImage.selectImage(context, false);
      },
      child: Stack(
        children: [
          Ink(
            width: MDime.xxxxl.w,
            height: MDime.xxxxl.w,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                  color: DarkLightTheme.isDark(context)
                      ? ThemeColor.green
                      : ThemeColor.red,
                  width: MDime.xs.w),
              // image: DecorationImage(
              //     image: controllerImage.getImageUser(false), fit: BoxFit.fill),
            ),
          ),
          PositionedDirectional(
            bottom: 0,
            end: 5,
            child: Icon(CupertinoIcons.pencil,
                size: MDime.xl.w, color: ThemeColor.teal),
          )
        ],
      ),
    );
  }
}
