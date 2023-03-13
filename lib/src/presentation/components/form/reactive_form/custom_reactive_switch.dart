import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/components/form/normal_form/custom_switch.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomReactiveSwitch extends ReactiveFormField<bool, bool> {
  CustomReactiveSwitch({
    Key? key,
    String? label,
    Map<String, String Function(Object)>? validationMessages,
    required String formControlName,
    IconData? icon,
    IconData? prefixIcon,
    Color? activeColor,
    ShapeBorder? shape,
  }) : super(
          key: key,
          validationMessages: validationMessages,
          formControlName: formControlName,
          builder: (ReactiveFormFieldState<bool, bool> field) {
            return CustomSwitch(
              label: label,
              value: field.value,
              onChanged: (value) {
                field.didChange(value);
              },
              activeColor: activeColor,
              shape: shape,
              icon: icon,
              prefixIcon: prefixIcon,
            );
          },
        );
}
