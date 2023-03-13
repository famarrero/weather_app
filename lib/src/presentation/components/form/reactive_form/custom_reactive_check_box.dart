import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/components/form/normal_form/custom_check_box.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomReactiveCheckBox extends ReactiveFormField<bool, bool> {
  CustomReactiveCheckBox({
    Key? key,
    required String formControlName,
    String? label,
    ListTileControlAffinity? controlAffinity,
    Color? activeColor,
    ShapeBorder? shape,
  }) : super(
            key: key,
            formControlName: formControlName,
            builder: (ReactiveFormFieldState<bool, bool> field) {
              return Builder(builder: (context) {
                return CustomCheckBox(
                    label: label,
                    value: field.value ?? false,
                    controlAffinity: controlAffinity,
                    activeColor: activeColor,
                    shape: shape,
                    onChanged: (newValue) => field.didChange(newValue));
              });
            });
  @override
  ReactiveFormFieldState<bool, bool> createState() =>
      ReactiveFormFieldState<bool, bool>();
}
