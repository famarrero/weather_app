import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/app/theme/dimensions.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    Key? key,
    this.label,
    this.value,
    this.controlAffinity,
    this.activeColor,
    this.shape,
    required this.onChanged,
  }) : super(key: key);

  final String? label;
  final bool? value;
  final ListTileControlAffinity? controlAffinity;
  final Color? activeColor;
  final ShapeBorder? shape;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      dense: true,
      title: label != null ? Text(label!) : null, //   <-- label
      value: value ?? false,
      onChanged: (newValue) => onChanged(newValue ?? false),
      controlAffinity: controlAffinity ?? ListTileControlAffinity.leading,
      contentPadding: const EdgeInsets.all(2),
      activeColor: activeColor ?? Theme.of(context).primaryColor,
      shape: shape ??
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(kCorner)),
    );
  }
}
