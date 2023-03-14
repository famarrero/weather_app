import 'package:flutter/material.dart';

abstract class AppColors {
  static const primaryColor = Color.fromARGB(255, 255, 165, 30);
  static const primaryColorDark = Color.fromARGB(255, 253, 153, 2);
  static const secondaryColor = Color.fromARGB(255, 93, 129, 230);
  static const secondaryColorDark = Color.fromARGB(255, 48, 100, 243);
  static const secondaryColorLight = Color.fromARGB(255, 187, 202, 241);

  static const red = Color(0xffB11C1C);
  static const green = Color.fromARGB(255, 121, 187, 23);
  static const black = Color.fromARGB(255, 19, 18, 18);
  static const grey = Color(0xff606060);

  static const platinum = Color(0xfff6f6f6);
  static const lightGrey = Color(0xffe5e5e7);
  static const mediumGrey = Color(0xff808084);
}

Color getPrimaryColorByTheming(
  BuildContext context, {
  Color? lightColor,
  Color? darkColor,
}) {
  if (Theme.of(context).brightness == Brightness.light) {
    return lightColor ?? Theme.of(context).primaryColor;
  } else {
    return darkColor ?? Colors.white;
  }
}
