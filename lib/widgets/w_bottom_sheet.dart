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
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

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
              ConstantLocalization.chooseWay.tr(),
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
                      data: ConstantLocalization.carOwner,
                      onTap: () async {
                        const number = '0799196171'; //set the number here
                        bool? res =
                            await FlutterPhoneDirectCaller.callNumber(number);
                      }),
                ),
                Expanded(
                  child: WImageAuth(
                      url: ModelPictres.camera,
                      data: ConstantLocalization.government,
                      onTap: () async {
                        Uri phoneno = Uri.parse('tel:911');
                        if (await launchUrl(phoneno)) {
                          //dialer opened
                        } else {
                          //dailer is not opened
                        }
                      }),
                ),
              ],
            ),
          ],
        ));
  }
}
