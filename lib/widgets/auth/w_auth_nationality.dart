import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;
import '../../constants/names.dart';
import '../../controller/controller_auth.dart';
import '../../model/m_login.dart';
import '../../theme/icons.dart';
import '../textfield.dart';

class WidgetAuthNationality extends StatelessWidget {
  const WidgetAuthNationality({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerAuth auth = Provider.of<ControllerAuth>(context, listen: false);
    developer.log('send data PhoneNumber to provider',
        name: 'widget nationality');
    return WidgetTextField(
      hintText: MLogin.phone,
      labelText: ConstantNames.id,
      iconBefore: ThemeIcons.nationality,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.numeric(),
        FormBuilderValidators.maxLength(10),
        FormBuilderValidators.minLength(10),
      ]),
      onSaved: auth.dataUser.setnationality,
    );
  }
}
