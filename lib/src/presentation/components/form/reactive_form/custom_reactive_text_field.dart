import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/src/presentation/components/form/form_decoration.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomReactiveTextField<T> extends StatelessWidget {
  // final String? errorText;

  const CustomReactiveTextField({
    this.onSubmitted,
    required this.formControlName,
    this.validationMessages,
    this.hint,
    this.label,
    this.icon,
    this.textCapitalization = TextCapitalization.none,
    this.textType = TextInputType.text,
    this.textInputAction,
    this.inputFormatters,
    this.obscureText,
    this.mandatory = false,
    this.expands = false,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.hideCounterText = false,
    this.backgroundColor,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.isDense = true,
    this.decoration,
    // this.errorText,
  });

  /// [ReactiveTextField] Specific props;
  final String formControlName;
  final Function(FormControl<T>)? onSubmitted;
  final Map<String, String Function(Object)>? validationMessages;
  final Color? backgroundColor;

  /// [TextField] custom props;
  final String? hint;
  final String? label;
  final IconData? icon;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  final TextInputType textType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final TextInputType? keyboardType;

  final int? maxLength;
  final int? maxLines;
  final int? minLines;

  final bool mandatory;
  final bool expands;
  final bool isDense;

  final bool? obscureText;
  final bool hideCounterText;
  final InputDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<T>(
      formControlName: formControlName,
      onSubmitted: onSubmitted,
      textCapitalization: textCapitalization,
      validationMessages: validationMessages,
      inputFormatters: inputFormatters,
      style: const TextStyle(height: 1),
      keyboardType: keyboardType ?? textType,
      textInputAction: textInputAction,
      expands: expands,
      maxLength: maxLength,
      minLines: minLines,
      maxLines: maxLines,
      cursorColor: Theme.of(context).primaryColor,
      obscureText: obscureText ?? false,
      decoration: formDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: (prefixIcon == null && suffixIcon == null) ? 14.5 : 8.0,
          horizontal: 8.0,
        ),
        isDense: isDense,
        labelText: label,
        mandatory: mandatory,
        hintText: hint,
        icon: icon,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        // errorText: errorText,
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }
}

class CustomReactiveObscureTextField extends StatefulWidget {
  const CustomReactiveObscureTextField({
    this.onSubmitted,
    required this.formControlName,
    this.validationMessages,
    this.mandatory = false,
    this.hint,
    this.label,
    this.icon,
    this.backgroundColor,
    this.textType = TextInputType.text,
    this.textInputAction,
    this.inputFormatters,
    this.prefixIcon,
    this.isDense = true,
  });

  /// [ReactiveTextField] Expecific props;
  final String formControlName;
  final Function(FormControl<String>)? onSubmitted;
  final Map<String, String Function(Object)>? validationMessages;

  /// [TextField] custom props;
  final String? hint;
  final String? label;
  final IconData? icon;
  final IconData? prefixIcon;

  final TextInputType textType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;

  final Color? backgroundColor;

  final bool mandatory;
  final bool isDense;

  @override
  _CustomReactiveObscureTextFieldState createState() =>
      _CustomReactiveObscureTextFieldState();
}

class _CustomReactiveObscureTextFieldState
    extends State<CustomReactiveObscureTextField> {
  late bool passwordVisible;

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
  }

  IconButton getToggleButton() {
    return IconButton(
      icon: Icon(
        // Based on passwordVisible state choose the icon
        passwordVisible ? Icons.visibility : Icons.visibility_off,
        // color: Theme.of(context).primaryColorDark,
      ),
      onPressed: () {
        // Update the state i.e. toogle the state of passwordVisible variable
        setState(() {
          passwordVisible = !passwordVisible;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<String>(
      formControlName: widget.formControlName,
      onSubmitted: widget.onSubmitted,
      validationMessages: widget.validationMessages,
      inputFormatters: widget.inputFormatters,
      style: const TextStyle(height: 1),
      keyboardType: widget.textType,
      textInputAction: widget.textInputAction,
      cursorColor: Theme.of(context).primaryColor,
      obscureText: !passwordVisible,
      decoration: formDecoration(
        labelText: widget.label,
        mandatory: widget.mandatory,
        hintText: widget.hint,
        icon: widget.icon,
        prefixIcon: widget.prefixIcon,
        suffixWidget: getToggleButton(),
        isDense: widget.isDense,
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }
}
