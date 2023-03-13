import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateFormatted on DateTime {
  DateTime oneMonthBeforeInSameYear() {
    final oneMonthBefore = subtract(const Duration(days: 31));
    if (oneMonthBefore.isBefore(
      DateTime(
        year,
      ),
    )) {
      return DateTime(
        year,
      );
    }
    return oneMonthBefore;
  }

  DateTime oneMonthBefore() {
    return subtract(const Duration(days: 31));
  }

  DateTime addDays(int days) {
    return add(Duration(days: days));
  }

  DateTime thisMonthAtInit() {
    return DateTime(
      year,
      month,
    );
  }

  DateTime thisMonthAtEnd() {
    return DateTime(year, month + 1, 0);
  }

  String get toFormattedDate {
    return DateFormat(
      'MMM d, h:mm a',
      Intl.getCurrentLocale(),
    ).format(this);
  }

  String get toShortFormattedDate {
    return DateFormat(
      'EEE, MMM d y',
      Intl.getCurrentLocale(),
    ).format(this);
  }

  String get toPipeFormattedDate {
    return DateFormat(
      'd/M/y',
      Intl.getCurrentLocale(),
    ).format(this);
  }

  String get toPipeFormattedDateWithHours {
    return DateFormat(
      'd/M/y',
      Intl.getCurrentLocale(),
    ).add_jm().format(this);
  }

  String get toFormattedMontYear {
    return DateFormat(
      'yMMMM',
      Intl.getCurrentLocale(),
    ).format(this);
  }

  String get toFormattedDayMontYear {
    return DateFormat(
      'MMM d,y',
      Intl.getCurrentLocale(),
    ).format(this);
  }
}

Future<DateTime?> selectDate(
  BuildContext context, {
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
}) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: initialDate ?? DateTime.now(),
    firstDate: firstDate ?? DateTime.now(),
    lastDate: lastDate ?? DateTime(2025),
  );
  if (picked != null) return picked;
  return null;
}

Future<DateTimeRange?> selectDateRange(
  BuildContext context, {
  DateTime? firstDate,
  DateTime? lastDate,
  DateTimeRange? initialDateRange,
}) async {
  // if (useFlutterOfficial) {
  //Flutter Now Support Officially DateRange Picker
  final DateTimeRange? picked = await showDateRangePicker(
    context: context,
    firstDate: firstDate ?? DateTime.now(),
    lastDate: lastDate ?? DateTime(2025),
    initialDateRange: initialDateRange,
    builder: (context, Widget? child) => Theme(
      data: Theme.of(context).copyWith(
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
              backgroundColor: Theme.of(context).primaryColor,
            ),
      ),
      child: child!,
    ),
  );
  if (picked != null) return picked;
  return null;
}
