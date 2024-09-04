import 'package:flutter/material.dart';

class ThemeTextStyle {
  // --------------- text font size big --------

  /// [dLarge]  displayLarge type: `Regular`  size: `57` space: `0`
  static TextStyle? dLarge(BuildContext context) =>
      Theme.of(context).textTheme.displayLarge;

  /// [dMedium]  displayMedium type: `Regular` size: `45` space: `0`
  static TextStyle? dMedium(BuildContext context) =>
      Theme.of(context).textTheme.displayMedium;

  /// [dSmall] displaySmall type: `Regular`  size: `36` space: `0`
  static TextStyle? dSmall(BuildContext context) =>
      Theme.of(context).textTheme.displaySmall;

  // ------------ title main ----------------
  /// [hLarge] headlineLarge type: `Regular`  size: `32` space: `0`
  static TextStyle? hLarge(BuildContext context) =>
      Theme.of(context).textTheme.headlineLarge;

  /// [hMedium] headlineMedium type: `Regular` size: `28` space: `0`
  static TextStyle? hMedium(BuildContext context) =>
      Theme.of(context).textTheme.headlineMedium;

  /// [hSmall] headlineSmall type: `Regular` size: `24` space: `0`
  static TextStyle? hSmall(BuildContext context) =>
      Theme.of(context).textTheme.headlineSmall;

  // ---------------- title pyrography -------------
  /// [tLarge] titleLarge Medium size  `22` space `0`
  static TextStyle? tLarge(BuildContext context) =>
      Theme.of(context).textTheme.titleLarge;

  /// [tMedium] titleMedium Medium size  `16` space `0.15`
  static TextStyle? tMedium(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium;

  /// [tSmall] titleSmall Medium size  `14` space `0.1`
  static TextStyle? tSmall(BuildContext context) =>
      Theme.of(context).textTheme.titleSmall;

  //------------- pyrography--------------
  /// [bLarge] bodyLarge type: `Regular` size: `16` space: `0.15`
  static TextStyle? bLarge(BuildContext context) =>
      Theme.of(context).textTheme.bodyLarge;

  /// [bMedium] bodyMedium type: `Regular` size: `14` space: `0.25`
  static TextStyle? bMedium(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium;

  /// [bSmall]  bodySmall type: `Regular` size:  `12` space: `0.4`
  static TextStyle? bSmall(BuildContext context) =>
      Theme.of(context).textTheme.bodySmall;

  // ----------------- Button -----------------
  /// [lLarge] labelLarge type: `Medium` size: `14` space: `0.1`
  static TextStyle? lLarge(BuildContext context) =>
      Theme.of(context).textTheme.labelLarge;

  ///  [lMedium] labelMedium type: `Medium` size: `12` space: `0.5`
  static TextStyle? lMedium(BuildContext context) =>
      Theme.of(context).textTheme.labelMedium;

  ///  [lSmall]  labelSmall type: `Medium` size: `11` space: `0.5`
  static TextStyle? lSmall(BuildContext context) =>
      Theme.of(context).textTheme.labelSmall;
}
