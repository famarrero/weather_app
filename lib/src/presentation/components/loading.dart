import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLinearProgressIndicator extends StatelessWidget {
  const CustomLinearProgressIndicator(
      {Key? key, this.backgroundColor, this.minHeight})
      : super(key: key);
  final Color? backgroundColor;
  final double? minHeight;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      minHeight: minHeight ?? 5,
      backgroundColor: backgroundColor ?? Colors.white,
    );
  }
}

class CustomCircularLoadingIndicator extends StatelessWidget {
  const CustomCircularLoadingIndicator({
    Key? key,
    this.radius,
    this.color,
  }) : super(key: key);
  final double? radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        radius: radius ?? 20.0,
        color: color ?? Theme.of(context).primaryColor,
      ),
    );
  }
}
