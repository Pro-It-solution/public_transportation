
import 'package:flutter/material.dart';
import 'package:new_app00/model/dimensions.dart';

class WidgetProgress extends StatelessWidget {
  const WidgetProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Transform.scale(
      scale: MDime.xs,
      child: const Opacity(
        opacity: MDime.half,
        child: CircularProgressIndicator.adaptive(),
      ),
    )));
  }
}
