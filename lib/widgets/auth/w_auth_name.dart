import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;
import '../../constants/names.dart';
import '../../controller/controller_auth.dart';
import '../../model/m_login.dart';
import '../../theme/icons.dart';
import '../textfield.dart';

class WidgetAuthUsername extends StatelessWidget {
  const WidgetAuthUsername({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerAuth auth = Provider.of<ControllerAuth>(context, listen: false);
    developer.log('send data username to provider', name: 'widget username');
    return WidgetTextField(
      hintText: MLogin.username,
      labelText: ConstantNames.username,
      iconBefore: ThemeIcons.userName,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.match(RegExp(r'^[a-zA-Z\u0600-\u06FF\s]{5,}$'),
            errorText: "is not valid name"),
      ]),
      onSaved: auth.dataUser.setUserName,
    );
  }
}
