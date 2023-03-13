import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/app/theme/text_styles.dart';

class CustomBadge extends StatelessWidget {
  const CustomBadge({
    Key? key,
    this.color,
    this.icon,
    this.text,
    this.height = 21,
  }) : super(key: key);

  final Color? color;
  final IconData? icon;
  final String? text;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 2),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color?.withAlpha(50) ??
            Theme.of(context).primaryColor.withAlpha(50),
        borderRadius: const BorderRadius.all(Radius.circular(60)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: icon != null,
            child: FittedBox(
              child: Icon(
                icon,
                color: color ?? Theme.of(context).primaryColor,
              ),
            ),
          ),
          Visibility(
            visible: text != null,
            child: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: FittedBox(
                child: Text(
                  text ?? '',
                  maxLines: 1,
                  style: textStyleBody.copyWith(
                    color: color ?? Theme.of(context).primaryColor,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
