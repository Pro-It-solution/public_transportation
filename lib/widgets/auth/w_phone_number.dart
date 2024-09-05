import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;
import '../../constants/names.dart';
import '../../controller/controller_auth.dart';
import '../../model/m_login.dart';
import '../../theme/icons.dart';
import '../textfield.dart';

class WidgetAuthPhoneNumber extends StatelessWidget {
  const WidgetAuthPhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerAuth auth = Provider.of<ControllerAuth>(context, listen: false);
    developer.log('send data PhoneNumber to provider',
        name: 'widget PhoneNumber');
    return WidgetTextField(
      hintText: MLogin.phone,
      labelText: ConstantNames.phoneNumber,
      iconBefore: ThemeIcons.call,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.numeric(),
        FormBuilderValidators.maxLength(10),
        FormBuilderValidators.minLength(10),
      ]),
      onSaved: auth.dataUser.setphoneNumber,
    );
  }
}
