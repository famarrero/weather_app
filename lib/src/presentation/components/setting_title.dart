import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/src/presentation/app/theme/text_styles.dart';
import 'package:weather_app/src/presentation/components/custom_card.dart';

class SettingTitle extends StatelessWidget {
  const SettingTitle({
    Key? key,
    required this.title,
    this.icon,
    this.imagePath,
    this.svgPath,
    this.onPressed,
    this.trailing,
    this.bottom,
    this.backgroundColor,
  }) : super(key: key);

  final String title;
  final IconData? icon;
  final String? imagePath;
  final String? svgPath;
  final Function()? onPressed;
  final Widget? trailing;
  final Widget? bottom;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: CustomCard(
        backgroundColor: backgroundColor ??
            (Theme.of(context).brightness == Brightness.light
                ? Theme.of(context).cardColor
                : Colors.black26),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 14),
          child: Column(
            children: [
              Row(
                children: [
                  if (icon != null) ...[
                    Icon(icon),
                  ],
                  if (imagePath != null) ...[
                    Image.asset(imagePath!),
                  ],
                  if (svgPath != null) ...[
                    SvgPicture.asset(svgPath!),
                  ],
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Text(
                      title,
                      style: textStyleBody,
                    ),
                  ),
                  if (trailing != null) trailing!
                ],
              ),
              if (bottom != null) bottom!,
            ],
          ),
        ),
      ),
    );
  }
}
