import 'package:flutter/material.dart';

class ThemeRestart extends StatefulWidget {
  const ThemeRestart({super.key, required this.child});
  final Widget child;
  @override
  State<ThemeRestart> createState() => _UtilsRestartState();

  // access for any thing include class private
  static void reDraw(BuildContext context) =>
      context.findAncestorStateOfType<_UtilsRestartState>()?.changeKey();
}

class _UtilsRestartState extends State<ThemeRestart> {
  /// [key] create key
  Key key = UniqueKey();

  /// [changeKey]  new key and update ui
  void changeKey() {
    key = UniqueKey();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(key: key, child: widget.child);
  }
}
