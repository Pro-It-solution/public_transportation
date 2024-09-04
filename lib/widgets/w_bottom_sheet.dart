import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_app00/constants/localization.dart';
import 'package:new_app00/controller/controller_image.dart';
import 'package:new_app00/model/dimensions.dart';
import 'package:new_app00/model/pictures.dart';
import 'package:new_app00/theme/text_style.dart';
import 'package:new_app00/widgets/w_image_auth.dart';
import 'package:provider/provider.dart';

class WidgetDesignBottomSheet extends StatelessWidget {
  const WidgetDesignBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    // create controller image user
    ControllerImage authImage =
        Provider.of<ControllerImage>(context, listen: false);
    return SizedBox(
        height: (MDime.xxxxl).h,
        child: Column(
          children: [
            // title
            Flexible(
                child: Text(
              ConstantLocalization.choosePicture.tr(),
              style: ThemeTextStyle.dSmall(context),
            )),

            // space
            MDime.l.verticalSpace,

            // choice gallery or camera
            Row(
              children: [
                Expanded(
                  child: WImageAuth(
                    url: ModelPictres.gallery,
                    data: ConstantLocalization.gallery,
                    onTap: () => authImage.selectImage(context, true),
                  ),
                ),
                Expanded(
                  child: WImageAuth(
                    url: ModelPictres.camera,
                    data: ConstantLocalization.camera,
                    onTap: () => authImage.selectImage(context, false),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
