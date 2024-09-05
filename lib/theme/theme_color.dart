import 'dart:ui';

class ThemeColor {
  /// [colorFromHex] convert from hex to flutter
  ///
  /// example : #ff3322 -> 0xFFff3322
  static Color colorFromHex(String hexColor, [String opacity = 'FF']) {
    // delete `#`
    String color = hexColor.replaceAll('#', ''); // ff3322

    if (color.length == 6) {
      // opacity
      String colorOpacity = '$opacity$color'; // FFff3322
      // 0xFFff3322
      int? colorHex = int.tryParse(colorOpacity, radix: 16);
      return Color(colorHex ?? (0xFFFFFFFF));
    } else {
      return const Color(0xFFFFFFFF);
    }
  }

  static Color appbar = const Color.fromARGB(248, 5, 112, 248);
  static Color bluefateh = const Color.fromARGB(248, 5, 112, 248);

  static Color gold = const Color.fromARGB(200, 255, 200, 0);
  static Color green = const Color.fromARGB(255, 0, 100, 0);
  static Color red = const Color.fromARGB(255, 155, 17, 30);
  static Color white = const Color.fromARGB(255, 255, 255, 255);
  static Color black = const Color.fromARGB(0, 0, 0, 0);
  static final Color grey = colorFromHex('#C8C8C8');
  static final Color greenBold = colorFromHex('#1B5E20');
  static final Color blue = colorFromHex('#2196F3');
  static final Color pink = colorFromHex('#BB86FC');
  static final Color purple = colorFromHex('#9C27B0');
  static final Color teal = colorFromHex('#008080');
  static final Color blueMagenta = colorFromHex('#151026');
  static final Color blueGrey = colorFromHex('#607D8B');
  static final Color deepOrange = colorFromHex('#FF5722');
  static final Color redAccent = colorFromHex('#FF5252');
  // list color
  static final List<Color> btnAuth = [redAccent, deepOrange];
}
