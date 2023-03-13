import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:weather_app/src/presentation/app/theme/dimensions.dart';
import 'package:weather_app/src/presentation/components/form/form_decoration.dart';

typedef SyncItemList<T> = List<T> Function();
typedef ItemBuilder<T> = Widget Function(T item);

class CustomDropDownFiled<T> extends StatelessWidget {
  const CustomDropDownFiled({
    Key? key,
    required this.itemList,
    required this.itemBuilder,
    required this.onValueUpdate,
    this.value,
    this.icon,
    this.prefixIcon,
    this.label,
    this.hint,
    this.mandatory,
    this.isDense,
    this.expands,
    this.onTap,
    this.errorText,
  }) : super(key: key);

  final SyncItemList<T> itemList;
  final ItemBuilder<T> itemBuilder;
  final ValueChanged<T?> onValueUpdate;
  final T? value;
  final IconData? icon;
  final IconData? prefixIcon;
  final String? label;
  final String? hint;
  final bool? mandatory;
  final bool? isDense;
  final bool? expands;
  final String? errorText;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final scale = MediaQuery.of(context).textScaleFactor;

    return InputDecorator(
      isEmpty: value == null,
      decoration: formDecoration(
        contentPadding: EdgeInsets.only(
          right: prefixIcon == null ? 12.0 : 4.0,
          left: 8.0,
          top: 8.0,
          bottom: 8.0,
        ),
        labelText: label,
        mandatory: mandatory,
        hintText: hint,
        icon: icon,
        prefixIcon: prefixIcon,
        errorText: errorText,
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
      child: Container(
        constraints: const BoxConstraints(minHeight: 32),
        child: Center(
          child: DropdownButton<T>(
            value: value,
            underline: const SizedBox(),
            isExpanded: expands ?? true,
            isDense: isDense ?? true,
            onChanged: (newValue) {
              onValueUpdate.call(newValue);
            },
            icon: const Icon(
              Iconsax.arrow_down_1,
              size: kIconSize,
            ),
            onTap: onTap,
            items: itemList()
                .map(
                  (e) => DropdownMenuItem<T>(
                    value: e,
                    child: Container(
                      height: 45 * scale,
                      alignment: Alignment.centerLeft,
                      child: itemBuilder(e),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
