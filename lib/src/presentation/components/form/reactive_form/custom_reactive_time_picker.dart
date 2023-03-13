import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/components/form/normal_form/custom_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomReactiveTimePicker extends ReactiveFormField<TimeOfDay, TimeOfDay> {
  CustomReactiveTimePicker({
    Key? key,
    required String formControlName,
    Map<String, String Function(Object)>? validationMessages,
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
          builder: (ReactiveFormFieldState<TimeOfDay, TimeOfDay> field) {
            return CustomTimePicker(
              initialTime: field.value,
              onTimeUpdate: (TimeOfDay value) {
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
  ReactiveFormFieldState<TimeOfDay, TimeOfDay> createState() =>
      ReactiveFormFieldState<TimeOfDay, TimeOfDay>();
}
