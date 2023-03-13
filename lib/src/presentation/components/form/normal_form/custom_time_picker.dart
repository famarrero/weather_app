import 'package:flutter/material.dart';
import 'package:weather_app/src/core/utils/time_utils.dart';
import 'package:weather_app/src/presentation/components/form/form_decoration.dart';

class CustomTimePicker extends StatelessWidget {
  const CustomTimePicker({
    Key? key,
    this.initialTime,
    required this.onTimeUpdate,
    this.label,
    this.hint,
    this.backgroundColor,
    this.icon,
    this.prefixIcon,
    this.suffixIcon,
    this.errorText,
    this.isDense = false,
    this.mandatory = false,
  }) : super(key: key);

  final TimeOfDay? initialTime;
  final ValueChanged<TimeOfDay> onTimeUpdate;
  final String? label;
  final String? hint;
  final Color? backgroundColor;
  final IconData? icon;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final String? errorText;
  final bool mandatory;
  final bool isDense;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final selectedTime = await selectTime(
          context,
          initialTime: initialTime,
        );
        if (selectedTime != null) {
          onTimeUpdate.call(selectedTime);
        }
      },
      child: InputDecorator(
        isEmpty: initialTime == null,
        decoration: formDecoration(
          labelText: label,
          mandatory: mandatory,
          hintText: hint,
          icon: icon,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          errorText: errorText,
        ).applyDefaults(
          Theme.of(context).inputDecorationTheme,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            constraints: const BoxConstraints(minHeight: 32),
            child: Row(
              children: <Widget>[
                if (initialTime != null) ...[
                  Text(
                    getFormattedTime(initialTime!),
                    style: const TextStyle(fontSize: 16),
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
