import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/components/form/normal_form/custom_date_range_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomReactiveDateRangePicker
    extends ReactiveFormField<DateTimeRange, DateTimeRange> {
  CustomReactiveDateRangePicker({
    Key? key,
    required String formControlName,
    Map<String, String Function(Object)>? validationMessages,
    DateTime? selectableFirstDate,
    DateTime? selectableLastDate,
    String? label,
    bool mandatory = false,
    bool isDense = false,
    Color? backgroundColor,
    IconData? icon,
    IconData? prefixIcon,
    IconData? suffixIcon,
    String? hint,
  }) : super(
          key: key,
          formControlName: formControlName,
          validationMessages: validationMessages,
          builder:
              (ReactiveFormFieldState<DateTimeRange, DateTimeRange> field) {
            return CustomDateRangePicker(
              selectableFirstDate: selectableFirstDate,
              selectableLastDate: selectableLastDate,
              dateRange: field.value,
              onDateTimeRangeUpdate: (DateTimeRange value) {
                field.didChange(value);
              },
              label: label,
              hint: hint,
              backgroundColor: backgroundColor,
              icon: icon,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              errorText: field.errorText,
              mandatory: mandatory,
              isDense: isDense,
            );
          },
        );

  @override
  ReactiveFormFieldState<DateTimeRange, DateTimeRange> createState() =>
      ReactiveFormFieldState<DateTimeRange, DateTimeRange>();
}
