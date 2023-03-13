import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/app/theme/dimensions.dart';
import 'package:weather_app/src/presentation/app/theme/text_styles.dart';
import 'package:weather_app/src/presentation/components/primary_btn.dart';

class CustomDialogBox extends StatelessWidget {
  const CustomDialogBox({
    required this.title,
    this.icon,
    this.colorIcon,
    this.primaryColor,
    this.sizeIcon = kNormalIconSize,
    required this.body,
    required this.buttonPositiveName,
    this.buttonPositiveAction,
    this.buttonNegativeName,
    this.colorPositiveButton,
    this.colorNegativeButton,
    this.buttonNegativeAction,
  });

  final String title;
  final IconData? icon;
  final Color? colorIcon;
  final Color? primaryColor;
  final Color? colorPositiveButton;
  final Color? colorNegativeButton;
  final double? sizeIcon;
  final Widget body;
  final String buttonPositiveName;
  final Function()? buttonPositiveAction;
  final String? buttonNegativeName;
  final Function()? buttonNegativeAction;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 34, vertical: 12.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(kCorner),
          topLeft: Radius.circular(kCorner),
          bottomRight: Radius.circular(kCorner),
          bottomLeft: Radius.circular(kCorner),
        ),
      ),
      elevation: 0.0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: _contentBox(context),
    );
  }

  Widget _contentBox(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: textStyleDialogTitle,
                ),
              ),
              if (icon != null)
                Icon(
                  icon,
                  color: (colorIcon != null)
                      ? colorIcon!.withAlpha(220)
                      : Theme.of(context).primaryColor.withAlpha(220),
                  size: (sizeIcon != null) ? sizeIcon : 30,
                ),
            ],
          ),
          const SizedBox(height: 16),
          body,
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Visibility(
                visible: buttonNegativeName != null,
                child: CustomTextButton(
                  color: colorNegativeButton ?? primaryColor,
                  onPressed: (buttonNegativeAction != null)
                      ? buttonNegativeAction!
                      : () => Navigator.of(context).pop(),
                  text: (buttonNegativeName != null) ? buttonNegativeName! : '',
                ),
              ),
              const SizedBox(width: 20),
              CustomTextButton(
                color: colorPositiveButton ?? primaryColor,
                onPressed: (buttonPositiveAction != null)
                    ? buttonPositiveAction!
                    : () => Navigator.of(context).pop(),
                text: buttonPositiveName,
              ),
            ],
          ),
          const SizedBox(height: 8.0)
        ],
      ),
    );
  }
}

class CustomDialogs {
  Future<void> customDialogInformation({
    required BuildContext context,
    bool? isDismissible,
    required String title,
    IconData? icon,
    Color? colorIcon,
    Color? primaryColor,
    Color? colorPositiveButton,
    Color? colorNegativeButton,
    double? sizeIcon,
    required String message,
    required String buttonPositiveName,
    Function()? buttonPositiveAction,
    String? buttonNegativeName,
    Function()? buttonNegativeAction,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: isDismissible ?? false,
      builder: (BuildContext dialogContext) => CustomDialogBox(
        title: title,
        icon: icon,
        primaryColor: primaryColor,
        colorPositiveButton: colorPositiveButton,
        colorNegativeButton: colorNegativeButton,
        colorIcon: colorIcon,
        sizeIcon: sizeIcon,
        body: Row(
          children: [
            Expanded(
              child: Text(message, style: const TextStyle(fontSize: 16)),
            ),
          ],
        ),
        buttonPositiveName: buttonPositiveName,
        buttonPositiveAction: buttonPositiveAction,
        buttonNegativeName: buttonNegativeName,
        buttonNegativeAction: buttonNegativeAction,
      ),
    );
  }

  Future<void> customDialogBox({
    required BuildContext context,
    bool? isDismissible,
    required String title,
    IconData? icon,
    Color? colorIcon,
    Color? primaryColor,
    Color? colorPositiveButton,
    Color? colorNegativeButton,
    double? sizeIcon,
    required Widget body,
    required String buttonPositiveName,
    Function()? buttonPositiveAction,
    String? buttonNegativeName,
    Function()? buttonNegativeAction,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: isDismissible ?? false,
      builder: (BuildContext dialogContext) => CustomDialogBox(
        title: title,
        icon: icon,
        primaryColor: primaryColor,
        colorPositiveButton: colorPositiveButton,
        colorNegativeButton: colorNegativeButton,
        colorIcon: colorIcon,
        sizeIcon: sizeIcon,
        body: body,
        buttonPositiveName: buttonPositiveName,
        buttonPositiveAction: buttonPositiveAction,
        buttonNegativeName: buttonNegativeName,
        buttonNegativeAction: buttonNegativeAction,
      ),
    );
  }

  Future<void> customDialogInformationWithCheckBox({
    required BuildContext context,
    bool? isDismissible,
    required String title,
    IconData? icon,
    Color? colorIcon,
    Color? primaryColor,
    Color? colorPositiveButton,
    Color? colorNegativeButton,
    double? sizeIcon,
    required String message,
    required String messageCheck,
    required String buttonPositiveName,
    Function()? buttonPositiveAction,
    String? buttonNegativeName,
    Function()? buttonNegativeAction,
    required bool checkboxValue,
    required void Function(bool?) checkboxFunction,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: isDismissible ?? false,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            return CustomDialogBox(
              title: title,
              icon: icon,
              colorIcon: colorIcon,
              primaryColor: primaryColor,
              colorPositiveButton: colorPositiveButton,
              colorNegativeButton: colorNegativeButton,
              sizeIcon: sizeIcon,
              body: Column(
                children: [
                  Text(message, style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 12),
                  CheckboxListTile(
                    title: Text(
                      messageCheck,
                      style: const TextStyle(fontSize: 16),
                    ),
                    value: checkboxValue,
                    onChanged: (value) {
                      setState(() {
                        // checkboxValue = value!;
                        checkboxFunction(value);
                      });
                    },
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                  )
                ],
              ),
              buttonPositiveName: buttonPositiveName,
              buttonPositiveAction: buttonPositiveAction,
              buttonNegativeName: buttonNegativeName,
              buttonNegativeAction: buttonNegativeAction,
            );
          },
        );
      },
    );
  }
}
