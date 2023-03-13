import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/app/theme/dimensions.dart';
import 'package:weather_app/src/presentation/app/theme/text_styles.dart';
import 'package:weather_app/src/presentation/components/form/form_decoration.dart';

class GroupSelectChip<T> extends StatelessWidget {
  const GroupSelectChip({
    Key? key,
    required this.availableOptions,
    this.selectedChoice,
    required this.onSelectionChanged,
    required this.labelOfChip,
    this.errorText,
    this.labelOfGroup,
    this.icon,
    this.suffixIcon,
    this.prefixIcon,
    this.isDense = true,
    this.mandatory = false,
    this.scrollHorizontal = false,
    this.border,
  }) : super(key: key);

  final List<T> availableOptions;
  final T? selectedChoice;
  final ValueChanged<T?> onSelectionChanged;
  final Function(T) labelOfChip;
  final String? errorText;
  final String? labelOfGroup;
  final IconData? icon;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final bool isDense;
  final bool mandatory;
  final bool scrollHorizontal;
  final InputBorder? border;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InputDecorator(
            decoration: formDecoration(
              border: border,
              isDense: isDense,
              mandatory: mandatory,
              labelText: labelOfGroup,
              icon: icon,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              errorText: errorText,
            ).applyDefaults(
              Theme.of(context).inputDecorationTheme,
            ),
            child: scrollHorizontal == false
                ? Wrap(
                    children: _buildChoiceList(context),
                  )
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      children: _buildChoiceList(context),
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildChoiceList(BuildContext context) {
    return availableOptions
        .map(
          (item) => CustomChoiceChip(
            name: labelOfChip(item) as String,
            selected: item == selectedChoice,
            onSelected: (selected) {
              if (item != selectedChoice) {
                onSelectionChanged.call(item);
              } else {
                onSelectionChanged.call(null);
              }
            },
          ),
        )
        .toList();
  }
}

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip({
    Key? key,
    required this.name,
    required this.selected,
    required this.onSelected,
  }) : super(key: key);

  final String name;
  final bool selected;
  final Function(bool) onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ChoiceChip(
        label: Text(
          name,
          style: TextStyle(
            color: selected ? Colors.white : Theme.of(context).primaryColor,
          ),
        ),
        labelStyle: textStyleLabel,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kCorner),
        ),
        side: BorderSide(color: Theme.of(context).primaryColor),
        backgroundColor:
            selected ? Theme.of(context).primaryColor : Colors.transparent,
        selectedColor: Theme.of(context).primaryColor,
        selected: selected,
        onSelected: onSelected,
      ),
    );
  }
}
