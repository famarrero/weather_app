import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/components/form/normal_form/custom_text_field.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomReactiveCurrencyField extends ReactiveFormField<int, int> {
  CustomReactiveCurrencyField({
    Key? key,
    required String formControlName,
    Map<String, String Function(Object)>? validationMessages,
    String? hint,
    String? label,
    IconData? icon,
    IconData? suffixIcon,
    IconData? prefixIcon,
    TextInputAction? textInputAction,
    int? maxLength,
    bool expands = false,
    bool isDense = true,
    bool mandatory = false, //For showing an Asterisk
    Color? backgroundColor,
  }) : super(
          key: key,
          formControlName: formControlName,
          validationMessages: validationMessages,
          builder: (ReactiveFormFieldState<int, int> field) {
            return _CurrencyWidget(
              field: field,
              hint: hint,
              label: label,
              icon: icon,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              textInputAction: textInputAction,
              maxLength: maxLength,
              expands: expands,
              isDense: isDense,
              mandatory: mandatory, //For showing an Asterisk
              backgroundColor: backgroundColor,
            );
          },
        );

  @override
  ReactiveFormFieldState<int, int> createState() =>
      ReactiveFormFieldState<int, int>();
}

class _CurrencyWidget extends StatefulWidget {
  const _CurrencyWidget({
    Key? key,
    required this.field,
    this.hint,
    this.label,
    this.icon,
    this.suffixIcon,
    this.prefixIcon,
    this.textInputAction,
    this.maxLength,
    this.expands = false,
    this.isDense = true,
    this.mandatory = false, //For showing an Asterisk
    this.backgroundColor,
  }) : super(key: key);

  final ReactiveFormFieldState<int, int> field;
  final String? hint;
  final String? label;
  final IconData? icon;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final bool expands;
  final bool isDense;
  final bool mandatory; //For showing an Asterisk
  final Color? backgroundColor;

  @override
  State<_CurrencyWidget> createState() => _CurrencyWidgetState();
}

class _CurrencyWidgetState extends State<_CurrencyWidget> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();

    if (widget.field.value != null) {
      controller.text = (widget.field.value! / 100).toString();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      onChanged: (value) {
        if (value.isNotEmpty) {
          widget.field.didChange(
              (double.parse(value.replaceAll('\$', '')) * 100).toInt());
        }
      },
      label: widget.label,
      hint: widget.hint,
      icon: widget.icon,
      prefixIcon: widget.prefixIcon,
      suffixIcon: widget.suffixIcon,
      errorText: widget.field.errorText,
      mandatory: widget.mandatory,
      isDense: widget.isDense,
      expands: widget.expands,
      maxLength: widget.maxLength,
      textInputAction: widget.textInputAction,
      keyboardType: TextInputType.number,
      inputFormatters: [
        TextInputMask(
            mask: '9+.99', placeholder: '0', maxPlaceHolders: 3, reverse: true),
      ],
    );
  }
}
