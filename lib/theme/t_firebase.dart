import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../firebase_options.dart';
import '../widgets/w_progress.dart';
import 'wrapper.dart';

class TFirebase extends StatelessWidget {
  const TFirebase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const WidgetProgress();
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return const Wrapper();
          }
          return const Wrapper();
        },
      ),
    );
  }
}
