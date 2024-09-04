import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/localization.dart';
import '../widgets/textfield.dart';

class ViewLoginPage extends StatelessWidget {
  const ViewLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    String? _nationalID;

    String? _password;
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(ConstantLocalization.appName.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const WidgetTextField(
                labelText: "ehab",
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: ConstantLocalization.nationID.tr()),
                keyboardType: TextInputType.number,
                maxLength: 10,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, // يقبل الأرقام فقط
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return ConstantLocalization.nationNUllValueError.tr();
                  }
                  if (value.length != 10) {
                    return ConstantLocalization.nationIDLengthError.tr();
                  }
                  return null;
                },
                onSaved: (value) {
                  _nationalID = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: ConstantLocalization.password.tr()),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return ConstantLocalization.nationNUllValueError.tr();
                  }
                  if (value.length < 6 || value.length > 15) {
                    return ConstantLocalization.passwordLengthError.tr();
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // تنفيذ منطق تسجيل الدخول هنا
                  }
                },
                child: Text(ConstantLocalization.login.tr()),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  // تنفيذ المنطق لفتح صفحة جديدة هنا (حاليًا لن ينتقل لصفحة ثانية)
                },
                child: Column(
                  children: [
                    Text(
                      ConstantLocalization.dontHaveAcoount.tr(),
                      style: const TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 100, // يمكنك تعديل العرض حسب الحاجة
                      child: Divider(
                        color: Colors.blueAccent, // لون الخط
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
