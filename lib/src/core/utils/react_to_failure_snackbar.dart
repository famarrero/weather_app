import 'package:flutter/material.dart';
import 'package:weather_app/src/core/failure/failures.dart';
import 'package:weather_app/src/presentation/app/theme/text_styles.dart';

//BuildContext Extensions
extension BuildContextX on BuildContext {
  void reactToFailureWithSnackBar({
    Failure? failure,
    Icon? icon,
    Color? backgroundColor,
  }) {
    if (failure == null) return;
    String? errorMessage = '';

    errorMessage = failure.message;

    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            if (icon != null) ...[icon] else
              const Icon(
                Icons.warning_rounded,
                color: Colors.white,
              ),
            const SizedBox(
              width: 5,
            ),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    errorMessage,
                    style: textStyleBody,
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor ?? Colors.red,
      ),
    );
  }
}
