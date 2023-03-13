import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/app/theme/dimensions.dart';

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
              color: selected ? Colors.white : Theme.of(context).primaryColor),
        ),
        labelStyle:
            const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kCorner),
        ),
        side: BorderSide(color: Theme.of(context).primaryColor),
        backgroundColor:
            selected ? Theme.of(context).primaryColor : Colors.white,
        selectedColor: Theme.of(context).primaryColor,
        selected: selected,
        onSelected: onSelected,
      ),
    );
  }
}
