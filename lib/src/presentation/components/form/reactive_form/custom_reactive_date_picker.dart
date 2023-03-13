import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/components/form/normal_form/custom_date_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomReactiveDatePicker extends ReactiveFormField<DateTime, DateTime> {
  CustomReactiveDatePicker({
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
          builder: (ReactiveFormFieldState<DateTime, DateTime> field) {
            return CustomDatePicker(
              selectableFirstDate: selectableFirstDate,
              selectableLastDate: selectableLastDate,
              date: field.value,
              onDateTimeUpdate: (DateTime value) {
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
  ReactiveFormFieldState<DateTime, DateTime> createState() =>
      ReactiveFormFieldState<DateTime, DateTime>();
}
