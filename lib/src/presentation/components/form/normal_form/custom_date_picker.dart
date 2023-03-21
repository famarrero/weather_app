import 'package:flutter/material.dart';
import 'package:weather_app/src/core/utils/date_utils.dart';
import 'package:weather_app/src/presentation/components/form/form_decoration.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({
    Key? key,
    this.selectableFirstDate,
    this.selectableLastDate,
    this.date,
    required this.onDateTimeUpdate,
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

  final DateTime? selectableFirstDate;
  final DateTime? selectableLastDate;
  final DateTime? date;
  final ValueChanged<DateTime> onDateTimeUpdate;
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
        final selectedDate = await selectDate(
          context,
          firstDate: selectableFirstDate,
          lastDate: selectableLastDate,
          initialDate: date,
        );
        if (selectedDate != null) {
          onDateTimeUpdate.call(selectedDate);
        }
      },
      child: InputDecorator(
        isEmpty: date == null,
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
              children: [
                if (date != null) ...[
                  Text(
                    date!.toPipeFormattedDate,
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
