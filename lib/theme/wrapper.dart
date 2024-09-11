import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_app00/view/home.dart';
import 'package:provider/provider.dart';

import '../controller/controller_auth.dart';
import '../view/login.dart';
import '../widgets/w_progress.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerAuth auth = Provider.of<ControllerAuth>(context, listen: false);
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: auth.userState,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const WidgetProgress();
          } else if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return const ViewHome();
            } else {
              return const ViewLoginPage();
            }
          } else {
            return const ViewLoginPage();
            // CErrorMassage(
            // massage: MLanguages.noconnect, callback: () {});
          }
        },
      ),
    );
  }
}
