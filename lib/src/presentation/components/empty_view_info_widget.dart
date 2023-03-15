import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/app/theme/text_styles.dart';
import 'package:weather_app/src/presentation/components/svg_icon_button.dart';

class EmptyViewInfoWidget extends StatelessWidget {
  const EmptyViewInfoWidget({
    Key? key,
    required this.title,
    this.subtitle,
    this.imgPath,
    this.svgPath,
    this.iconData,
    this.imgColor,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final String? imgPath;
  final String? svgPath;
  final IconData? iconData;
  final Color? imgColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(22),
          // child: NotificationListener(
          //   onNotification: (OverscrollIndicatorNotification? overScroll) {
          //     overScroll!.disallowIndicator();
          //     return true;
          //   },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (imgPath != null) ...[
                Image.asset(
                  imgPath!,
                  height: 80,
                  width: 80,
                ),
                const SizedBox(height: 22),
              ],
              if (svgPath != null) ...[
                SvgIconButton(
                  path: svgPath!,
                  size: 80,
                  color: imgColor,
                ),
                const SizedBox(height: 22),
              ],
              if (iconData != null) ...[
                Icon(
                  iconData,
                  size: 80,
                  color: imgColor ?? Colors.grey,
                ),
                const SizedBox(height: 22),
              ],
              Text(
                title,
                style: textStyleTitle.copyWith(
                  fontWeight: FontWeight.w600,
                  // color: Theme.of(context).primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 16),
                Text(
                  subtitle ?? '',
                  style: textStyleBody,
                  textAlign: TextAlign.center,
                )
              ]
            ],
          ),
          // ),
        ),
      ),
    );
  }
}
