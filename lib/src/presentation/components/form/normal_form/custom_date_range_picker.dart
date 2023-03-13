import 'package:flutter/material.dart';
import 'package:weather_app/src/core/utils/date_utils.dart';
import 'package:weather_app/src/presentation/components/form/form_decoration.dart';

class CustomDateRangePicker extends StatelessWidget {
  const CustomDateRangePicker({
    Key? key,
    this.selectableFirstDate,
    this.selectableLastDate,
    this.backgroundColor,
    this.dateRange,
    this.label,
    required this.onDateTimeRangeUpdate,
    this.icon,
    this.prefixIcon,
    this.suffixIcon,
    this.mandatory = false,
    this.isDense = false,
    this.hint,
    this.errorText,
  }) : super(key: key);

  final String? label;
  final Color? backgroundColor;
  final DateTimeRange? dateRange;
  final ValueChanged<DateTimeRange> onDateTimeRangeUpdate;
  final IconData? icon;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final bool mandatory;
  final bool isDense;
  final String? hint;
  final String? errorText;
  final DateTime? selectableFirstDate;
  final DateTime? selectableLastDate;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final selectedDateRange = await selectDateRange(
          context,
          firstDate: selectableFirstDate,
          lastDate: selectableLastDate,
          initialDateRange: dateRange,
        );
        if (selectedDateRange != null) {
          onDateTimeRangeUpdate.call(selectedDateRange);
        }
      },
      child: InputDecorator(
        isEmpty: dateRange == null,
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
                if (dateRange != null) ...[
                  Text(
                    dateRange!.start.toPipeFormattedDate,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text('--'),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    dateRange!.end.toPipeFormattedDate,
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
