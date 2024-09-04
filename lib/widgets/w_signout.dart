
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_app00/constants/localization.dart';
import 'package:new_app00/theme/text_style.dart';

class Wmassage extends StatelessWidget {
  const Wmassage({super.key, required this.title, required this.content});
  final Widget title;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    Widget buttom(
        BuildContext context, String tex, void Function()? onPressed) {
      return ElevatedButton(
              onPressed: onPressed,
              child: Text(
                tex.tr(),
                style: ThemeTextStyle.hSmall(context),
              ));
    }

    return AlertDialog.adaptive(
      title: title,
      content: content,
      actions: [
        buttom(context, ConstantLocalization.cancel.tr(), () {
          Navigator.pop(context);
        }),
        buttom(context, ConstantLocalization.ok.tr(), () {
          Navigator.pop(context);
        })
      ],
    );
  }
}
