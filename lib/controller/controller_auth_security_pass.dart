import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ControllerAuthSecurityPass extends ChangeNotifier {
  /// [iconEye] storage icon for display
  IconData iconEye = CupertinoIcons.eye;

  /// [isNotShowPass] when `true` no show pass | `false` show Pass
  ///
  /// default value [true]
  bool isNotShowPass = true;

  /// [handelPass] change [iconEye] and [isNotShowPass]
  void handelPass() {
    if (isNotShowPass) {
      // show pass
      isNotShowPass = false;
      iconEye = CupertinoIcons.eye_slash;
    } else {
      // no show pass
      isNotShowPass = true;
      iconEye = CupertinoIcons.eye;
    }
    // reDraw
    notifyListeners();
  }

  /// [reset] default value icon and showPass
  void reset() {
    iconEye = CupertinoIcons.eye;
    isNotShowPass = true;
    // update
    notifyListeners();
  }
}
