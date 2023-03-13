import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/app/theme/dimensions.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    this.child,
    this.backgroundColor,
    this.gradient,
    this.border,
    this.borderRadius,
    this.height,
    this.width,
    this.margin,
    this.elevation,
    this.constraints,
    this.onTap,
  }) : super(key: key);

  factory CustomCard.bordered({
    required BuildContext context,
    required Widget child,
    EdgeInsetsGeometry? margin,
    double? height,
    double? width,
    BorderRadius? borderRadius,
  }) {
    return CustomCard(
      margin: margin,
      height: height,
      width: width,
      borderRadius: borderRadius,
      backgroundColor: Theme.of(context).colorScheme.primary,
      border: Theme.of(context).brightness == Brightness.light
          ? Border.all(color: Theme.of(context).primaryColor.withAlpha(20))
          : null,
      child: child,
    );
  }

  final Widget? child;
  final Color? backgroundColor;
  final LinearGradient? gradient;
  final Border? border;
  final BorderRadius? borderRadius;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final double? elevation;
  final BoxConstraints? constraints;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      constraints: constraints,
      decoration: BoxDecoration(
        gradient: gradient,
        color: backgroundColor ?? Theme.of(context).cardColor,
        borderRadius:
            borderRadius ?? const BorderRadius.all(Radius.circular(kCorner)),
        border: border,
        boxShadow: <BoxShadow>[
          if (Theme.of(context).brightness == Brightness.light)
            BoxShadow(
              blurRadius: kCorner,
              color: Theme.of(context).primaryColor.withAlpha(20),
            )
        ],
      ),
      child: ClipRRect(
        borderRadius:
            borderRadius ?? const BorderRadius.all(Radius.circular(kCorner)),
        child: Material(
          color: Colors.transparent,
          elevation: elevation ?? 0.0,
          child: InkWell(
            borderRadius: borderRadius ??
                const BorderRadius.all(Radius.circular(kCorner)),
            onTap: onTap,
            child: child,
          ),
        ),
      ),
    );
  }
}
