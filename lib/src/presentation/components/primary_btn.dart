import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/app/theme/dimensions.dart';
import 'package:weather_app/src/presentation/app/theme/text_styles.dart';
import 'package:weather_app/src/presentation/components/loading.dart';

const _buttonHeight = 40.0;

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.borderRadius,
    this.width,
    this.backgroundColor,
  }) : super(key: key);
  final String text;
  final BorderRadius? borderRadius;
  final void Function()? onPressed;
  final double? width;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        minimumSize: Size(width ?? double.infinity, _buttonHeight),
        maximumSize: Size(width ?? double.infinity, _buttonHeight),
        shape: RoundedRectangleBorder(
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(kCorner)),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyleButton.copyWith(
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.borderRadius,
    this.width,
    this.iconData,
    this.backgroundColor,
    this.showShadowBackground = false,
  }) : super(key: key);
  final String text;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final void Function()? onPressed;
  final double? width;
  final IconData? iconData;
  final bool showShadowBackground;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        elevation: 0,
        backgroundColor:
            showShadowBackground ? backgroundColor?.withAlpha(40) : null,
        minimumSize: Size(width ?? double.infinity, _buttonHeight),
        maximumSize: Size(width ?? double.infinity, _buttonHeight),
        side: BorderSide(
          color: backgroundColor ?? Theme.of(context).primaryColor,
          width: 2.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(kCorner)),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconData != null) ...[
            Icon(iconData),
            const SizedBox(
              width: 5,
            ),
          ],
          Flexible(
            child: Text(
              text,
              style: textStyleButton.copyWith(
                color: backgroundColor,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.text,
    this.color,
    this.onPressed,
    this.width,
  }) : super(key: key);
  final String text;
  final Color? color;
  final void Function()? onPressed;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyleLabel.copyWith(
            color: color,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class CustomLoadingPrimaryButton extends StatelessWidget {
  const CustomLoadingPrimaryButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.borderRadius,
    this.isLoading,
    this.width,
  }) : super(key: key);
  final String text;
  final bool? isLoading;
  final double? width;
  final BorderRadius? borderRadius;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: _buttonHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
          minimumSize: Size(width ?? double.infinity, 38),
          maximumSize: Size(width ?? double.infinity, 38),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ??
                const BorderRadius.all(Radius.circular(kCorner)),
          ),
        ),
        onPressed: (isLoading != null && isLoading!) ? null : onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading!) ...[
              const CustomCircularLoadingIndicator(
                radius: 10,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
                height: 0,
              )
            ],
            Text(
              text,
              style: textStyleButton.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
