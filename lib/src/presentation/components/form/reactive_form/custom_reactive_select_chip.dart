import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/components/form/normal_form/custom_choice_chip.dart';
import 'package:reactive_forms/reactive_forms.dart';

typedef SyncLoadFunction<T> = List<T> Function();

class CustomReactiveSelectChip<T> extends ReactiveFormField<T, T> {
  CustomReactiveSelectChip({
    Key? key,
    required String formControlName,
    Map<String, String Function(Object)>? validationMessages,
    required SyncLoadFunction<T> availableOptions,
    required Function(T) labelOfChip,
    IconData? icon,
    String? labelOfGroup,
    IconData? suffixIcon,
    IconData? prefixIcon,
    bool isDense = false,
    bool mandatory = false,
  }) : super(
          key: key,
          formControlName: formControlName,
          validationMessages: validationMessages,
          builder: (ReactiveFormFieldState<T, T> field) {
            return GroupSelectChip<T>(
              errorText: field.errorText,
              labelOfGroup: labelOfGroup,
              icon: icon,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              isDense: isDense,
              mandatory: mandatory,
              availableOptions: availableOptions.call(),
              onSelectionChanged: (value) => field.didChange(value),
              labelOfChip: labelOfChip,
              selectedChoice: field.value,
            );
          },
        );
  @override
  ReactiveFormFieldState<T, T> createState() => ReactiveFormFieldState<T, T>();
}

typedef ItemBuilder<T> = Widget Function(T item);
