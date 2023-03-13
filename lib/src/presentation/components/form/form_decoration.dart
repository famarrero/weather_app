import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/app/theme/dimensions.dart';
import 'package:weather_app/src/presentation/app/theme/text_styles.dart';

InputDecoration formDecoration({
  bool isDense = true,
  EdgeInsetsGeometry? contentPadding,
  InputBorder? border,
  String? labelText,
  bool? mandatory = false,
  String? hintText,
  String? errorText,
  IconData? icon,
  IconData? prefixIcon,
  IconData? suffixIcon,
  Widget? suffixWidget,
}) =>
    InputDecoration(
      isDense: isDense,
      contentPadding: contentPadding ?? const EdgeInsets.all(8),
      border: border ??
          OutlineInputBorder(borderRadius: BorderRadius.circular(kCorner)),
      labelText: mandatory == true ? '$labelText *' : labelText,
      labelStyle: textStyleLabel,
      hintText: hintText,
      icon: icon != null
          ? Icon(
              icon,
              size: kIconSize,
            )
          : null,
      prefixIcon: prefixIcon != null
          ? Icon(
              prefixIcon,
              size: kIconSize,
            )
          : null,
      suffixIcon: suffixIcon != null
          ? Icon(
              suffixIcon,
              size: kIconSize,
            )
          : suffixWidget,
      errorText: errorText,
      errorStyle: const TextStyle(
        height: 0.9,
        color: Colors.red,
        fontWeight: FontWeight.normal,
      ),
    );
