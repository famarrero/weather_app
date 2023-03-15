import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/src/presentation/app/theme/dimensions.dart';
import 'package:weather_app/src/presentation/components/form/form_decoration.dart';

class CustomTextField<T> extends StatefulWidget {
  const CustomTextField({
    Key? key,
    this.initialValue,
    this.controller,
    this.hint,
    this.label,
    this.icon,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.inputFormatters,
    this.textCapitalization,
    this.obscureText,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.expands = false,
    this.isDense = true,
    this.onSubmitted,
    this.onChanged,
    this.mandatory = false,
    this.errorText,
    this.autofocus = false,
    this.decoration,
  }) : super(key: key);

  /// [TextField] custom props;
  final TextEditingController? controller;
  final String? initialValue;
  final String? hint;
  final String? label;
  final IconData? icon;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;
  final bool? obscureText;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool? expands;
  final bool autofocus;
  final bool isDense;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final bool mandatory; //For showing an Asterisk
  final String? errorText;
  final InputDecoration? decoration;

  @override
  State<CustomTextField<T>> createState() => _CustomTextFieldState<T>();
}

class _CustomTextFieldState<T> extends State<CustomTextField<T>> {
  late TextEditingController controller;
  @override
  void initState() {
    controller = widget.controller ?? TextEditingController();
    controller.text = widget.initialValue == null ? '' : widget.initialValue!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(      
      controller: controller,
      autofocus: widget.autofocus,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      inputFormatters: widget.inputFormatters,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      expands: widget.expands ?? false,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      cursorColor: Theme.of(context).primaryColor,
      obscureText: widget.obscureText ?? false,
      decoration: widget.decoration ??
          formDecoration(
            contentPadding: EdgeInsets.symmetric(
                vertical:
                    (widget.prefixIcon == null && widget.suffixIcon == null)
                        ? 14.5
                        : 8.0,
                horizontal: 8.0),
            isDense: widget.isDense,
            labelText: widget.label,
            mandatory: widget.mandatory,
            hintText: widget.hint,
            icon: widget.icon,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            errorText: widget.errorText,
          ).applyDefaults(
            Theme.of(context).inputDecorationTheme,
          ),
    );
  }
}

class CustomObscureTextField extends StatefulWidget {
  const CustomObscureTextField({
    Key? key,
    this.controller,
    this.initialValue,
    this.hint,
    this.label,
    this.errorText,
    this.icon,
    this.prefixIcon,
    this.textType = TextInputType.text,
    this.textInputAction,
    this.inputFormatters,
    this.backgroundColor,
    this.onSubmitted,
    this.onChanged,
    this.maxLength,
    this.expands,
    this.isDense = true,
    this.mandatory = false,
  }) : super(key: key);

  /// [TextField] custom props;
  final TextEditingController? controller;
  final String? initialValue;
  final String? hint;
  final String? label;
  final String? errorText;
  final bool? mandatory;
  final IconData? icon;
  final IconData? prefixIcon;
  final TextInputType textType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final Color? backgroundColor;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final bool? expands;
  final bool isDense;
  final int? maxLength;

  @override
  CustomObscureTextFieldState createState() => CustomObscureTextFieldState();
}

class CustomObscureTextFieldState extends State<CustomObscureTextField> {
  late bool passwordVisible;
  late TextEditingController controller;

  @override
  void initState() {
    controller = widget.controller ?? TextEditingController();
    if (widget.initialValue != null) {
      controller.text = widget.initialValue!;
    }
    passwordVisible = false;
    super.initState();
  }

  IconButton getToggleButton() {
    return IconButton(
      icon: Icon(
        // Based on passwordVisible state choose the icon
        passwordVisible ? Icons.visibility : Icons.visibility_off,
        size: kIconSize,
        // color: Theme.of(context).primaryColorDark,
      ),
      onPressed: () {
        // Update the state i.e. toggle the state of passwordVisible variable
        setState(() {
          passwordVisible = !passwordVisible;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      expands: widget.expands ?? false,
      onSubmitted: widget.onSubmitted,
      onChanged: widget.onChanged,
      inputFormatters: widget.inputFormatters,
      style: const TextStyle(height: 1),
      keyboardType: widget.textType,
      textInputAction: widget.textInputAction,
      cursorColor: Theme.of(context).primaryColor,
      obscureText: !passwordVisible,
      maxLines: 1,
      maxLength: widget.maxLength,
      decoration: formDecoration(
        labelText: widget.label,
        mandatory: widget.mandatory,
        hintText: widget.hint,
        icon: widget.icon,
        prefixIcon: widget.prefixIcon,
        suffixWidget: getToggleButton(),
        errorText: widget.errorText,
        isDense: widget.isDense,
      ),
    );
  }
}
