import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_app00/controller/controller_auth.dart';
import 'package:new_app00/widgets/auth/w_auth_name.dart';
import 'package:new_app00/widgets/auth/w_phone_number.dart';
import 'package:provider/provider.dart';

import '../constants/localization.dart';
import '../widgets/auth/w_auth_nationality.dart';
import '../widgets/textfield.dart';

class ViewLoginPage extends StatelessWidget {
  const ViewLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(ConstantLocalization.appName.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const WidgetAuthNationality(),
              const WidgetAuthUsername(),
              const WidgetAuthPhoneNumber(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    // تنفيذ منطق تسجيل الدخول هنا
                    ControllerAuth auth =
                        Provider.of<ControllerAuth>(context, listen: false);
                    auth.login(context);
                  }
                },
                child: Text(ConstantLocalization.login.tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
