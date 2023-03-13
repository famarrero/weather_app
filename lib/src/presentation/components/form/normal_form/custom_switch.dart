import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/app/theme/text_styles.dart';
import 'package:weather_app/src/presentation/components/form/form_decoration.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    Key? key,
    this.label,
    this.value,
    this.activeColor,
    this.shape,
    this.icon,
    this.prefixIcon,
    required this.onChanged,
  }) : super(key: key);

  final String? label;
  final bool? value;
  final Color? activeColor;
  final ShapeBorder? shape;
  final Function(bool) onChanged;
  final IconData? icon;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      isEmpty: true,
      decoration: formDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: 2.0, horizontal: prefixIcon == null ? 8.0 : 0.0),
        icon: icon,
        prefixIcon: prefixIcon,
        suffixWidget: Switch(
            value: value ?? false,
            onChanged: (newValue) => onChanged(newValue),
            activeColor: activeColor ?? Theme.of(context).primaryColor,
            splashRadius: 10),
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
      child: Row(
        children: [
          if (label != null)
            Expanded(
              child: Text(
                label!,
                style: textStyleLabel,
              ),
            ),
        ],
      ),
    );
  }
}
