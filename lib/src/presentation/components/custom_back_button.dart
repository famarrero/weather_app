import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
    this.color,
    this.onPressed,
    this.icon,
  }) : super(key: key);
  final Color? color;
  final VoidCallback? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    return IconButton(
      splashRadius: 20,
      icon: icon != null
          ? Icon(icon)
          : const Icon(
              Iconsax.arrow_left_2,           
            ),
      color: color ?? Theme.of(context).primaryColor,
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          Navigator.maybePop(context);
        }
      },
    );
  }
}
