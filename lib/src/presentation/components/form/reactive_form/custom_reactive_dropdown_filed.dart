import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/components/form/normal_form/custom_dropdown_filed.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomReactiveDropDownFiled<T> extends ReactiveFormField<T, T> {
  CustomReactiveDropDownFiled({
    Key? key,
    required String formControlName,
    required SyncItemList<T> itemList,
    required ItemBuilder<T> itemBuilder,
    IconData? icon,
    IconData? prefixIcon,
    bool mandatory = false,
    bool isDense = true,
    String? label,
    String? hint,
    Map<String, String Function(Object)>? validationMessages,
    Function()? onTap,
    Function(T)? onValueUpdate,
  }) : super(
          key: key,
          formControlName: formControlName,
          validationMessages: validationMessages,
          builder: (ReactiveFormFieldState<T, T> field) {
            return CustomDropDownFiled(
              itemList: itemList,
              itemBuilder: itemBuilder,
              onValueUpdate: (T? value) {
                field.didChange(value);
                if (onValueUpdate != null) {
                  onValueUpdate(value as T);
                }
              },
              value: field.value,
              icon: icon,
              prefixIcon: prefixIcon,
              label: label,
              onTap: onTap,
              errorText: field.errorText,
              isDense: isDense,
              hint: hint,
              mandatory: mandatory,
            );
          },
        );

  @override
  ReactiveFormFieldState<T, T> createState() => ReactiveFormFieldState<T, T>();
}
