import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/src/core/failure/failures.dart';
import 'package:weather_app/src/presentation/app/lang/l10n.dart';
import 'package:weather_app/src/presentation/app/theme/colors.dart';
import 'package:weather_app/src/presentation/app/theme/dimensions.dart';
import 'package:weather_app/src/presentation/app/theme/text_styles.dart';
import 'package:weather_app/src/presentation/components/primary_btn.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({
    Key? key,
    required this.title,
    this.failure,
    this.subtitle,
    this.imgPath,
    this.svgPath,
    this.iconData,
    this.imgSize,
    this.imgColor,
    this.retryText,
    this.retry,
  }) : super(key: key);

  final String title;
  final Failure? failure;
  final String? subtitle;
  final String? imgPath;
  final String? svgPath;
  final IconData? iconData;
  final double? imgSize;
  final Color? imgColor;
  final String? retryText;
  final Function()? retry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: kMaxWidthConstraint),
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: NotificationListener(
            onNotification: (OverscrollIndicatorNotification? overScroll) {
              overScroll!.disallowIndicator();
              return true;
            },
            child: ListView(
              shrinkWrap: true,
              children: [
                if (imgPath != null) ...[
                  Image.asset(
                    imgPath!,
                    height: imgSize ?? 80,
                    width: imgSize ?? 80,
                  ),
                  const SizedBox(height: 16),
                ],
                if (svgPath != null) ...[
                  SvgPicture.asset(
                    svgPath!,
                    height: imgSize ?? 80,
                    width: imgSize ?? 80,
                    // color: imgColor,
                  ),
                  const SizedBox(height: 16),
                ],
                if (iconData != null) ...[
                  Icon(
                    iconData,
                    size: imgSize ?? 80,
                    color: imgColor ?? AppColors.red,
                  ),
                  const SizedBox(height: 16),
                ],
                Text(
                  title,
                  style: textStyleTitle.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                if (subtitle != null && failure == null) ...[
                  const SizedBox(height: 8),
                  Text(
                    subtitle ?? '',
                    style: textStyleBody,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                ],
                if (failure != null) ...[
                  Text(
                    kDebugMode ? failure!.message : S.of(context).errorOcurred,
                    style: textStyleBody,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                ],
                CustomPrimaryButton(
                  width: 120,
                  text: retryText ?? S.of(context).retry,
                  onPressed: retry,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TapToRetryWidget extends StatelessWidget {
  const TapToRetryWidget({
    Key? key,
    this.failure,
    this.message,
    this.iconData,
    required this.onTap,
    this.color,
  }) : super(key: key);

  final Failure? failure;
  final String? message;
  final IconData? iconData;
  final Function() onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: kMaxWidthConstraint),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (iconData != null) ...[
              Icon(
                iconData,
                color: color ?? Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 4.0)
            ],
            if (failure == null)
              Text(
                message ?? S.of(context).errorOcurred,
                style: textStyleTitle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            if (failure != null) ...[
              Text(
                kDebugMode ? failure!.message : S.of(context).errorOcurred,
                style: textStyleTitle.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
                maxLines: 3,
              ),
            ],
            Text(
              S.of(context).tapToRetry,
              style: textStyleTitle.copyWith(
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
