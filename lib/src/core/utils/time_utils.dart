import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String getFormattedTime(TimeOfDay time) {
  return time.toAMPM;
  // return '${time.hour}:${time.minute} ${time.period.toString().split('.')[1].toUpperCase()}';
}

extension TimeX on TimeOfDay {
  String get toAMPM {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, this.hour, this.minute);
    final format = DateFormat("h:mm a");
    return format.format(dt);
  }
}

/// 12:03 PM
TimeOfDay getTimeOfDay(String timeInString) {
  final int hour = int.parse(timeInString.split(':')[0]);
  final int minute = int.parse(timeInString.split(':')[1].split(' ')[0]);
  return TimeOfDay(hour: hour, minute: minute);
}

Future<TimeOfDay?> selectTime(
  BuildContext context, {
  TimeOfDay? initialTime,
  TimePickerEntryMode? initialEntryMode,
  String? cancelText,
  String? confirmText,
  String? helpText,
}) async {
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: initialTime ?? TimeOfDay.now(),
    initialEntryMode: initialEntryMode ?? TimePickerEntryMode.dial,
    cancelText: cancelText,
    confirmText: confirmText,
    helpText: helpText,
    builder: (context, Widget? child) => Theme(
      data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
        primary: Theme.of(context).primaryColor,            
      )),
      child: child!,
    ),
  );
  if (picked != null) return picked;
  return null;
}
