import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/src/presentation/app/theme/dimensions.dart';

class SvgIconButton extends StatelessWidget {
  const SvgIconButton({
    Key? key,
    required this.path,
    this.onPressed,
    this.color,
    this.size,
  }) : super(key: key);

  final String path;
  final double? size;
  final VoidCallback? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10),
        child: SvgPicture.asset(
          path,
          height: size ?? kIconSize,
          width: size ?? kIconSize,
          color: color,
        ),
      ),
    );
  }
}
