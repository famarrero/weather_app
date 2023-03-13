import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/app/theme/colors.dart';
import 'package:weather_app/src/presentation/app/theme/dimensions.dart';
import 'package:weather_app/src/presentation/app/theme/text_styles.dart';

class CustomBottomModal extends StatelessWidget {
  ///Example of [height] MediaQuery.of(context).size.height * 0.8
  ///
  ///[bottomWidget] can be a button or anything else
  const CustomBottomModal({
    Key? key,
    this.title,
    this.titleColor,
    this.headerWidget,
    required this.child,
    this.bottomWidget,
    this.height,
    this.horizontalPadding = 14.0,
    this.bottomPadding = 6.0,
    this.viewInsetsBottomPadding = false,
    this.backgroundColor,
  }) : super(key: key);

  final String? title;
  final Color? titleColor;
  final Widget? headerWidget;
  final Widget child;
  final Widget? bottomWidget;

  final double? height;
  final double horizontalPadding;
  final double bottomPadding;
  final bool viewInsetsBottomPadding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: viewInsetsBottomPadding
            ? MediaQuery.of(context).viewInsets.bottom
            : 0,
      ),
      child: Container(
        height: height,
        padding: EdgeInsets.only(
          left: horizontalPadding,
          right: horizontalPadding,
          bottom: bottomPadding,
        ),
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).cardColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(kCorner * 1.8),
            topRight: Radius.circular(kCorner * 1.8),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 18),
            Container(
              width: MediaQuery.of(context).size.width * 0.1,
              height: 2.5,
              decoration: const ShapeDecoration(
                shape: StadiumBorder(),
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 12.0),
            if (title != null) ...[
              Text(
                title!,
                style: textStyleTitle.copyWith(
                  fontSize: kBigFontSized,
                  color: titleColor ?? getPrimaryColorByTheming(context),
                ),
              ),
              const SizedBox(height: 4.0),
              // const Divider(
              //   thickness: 0.9,
              // ),
            ],
            if (headerWidget != null) ...[
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: headerWidget,
              ),
            ],
            if (height != null)
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: child,
                ),
              )
            else
              child,
            if (bottomWidget != null) ...[
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: bottomWidget,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
