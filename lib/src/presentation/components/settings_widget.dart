import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:weather_app/src/presentation/app/lang/l10n.dart';
import 'package:weather_app/src/presentation/app/theme/colors.dart';
import 'package:weather_app/src/presentation/app/theme/dimensions.dart';
import 'package:weather_app/src/presentation/app/theme/text_styles.dart';
import 'package:weather_app/src/presentation/app/theme/theming.dart';
import 'package:weather_app/src/presentation/components/bottom_modal_sheet.dart';
import 'package:weather_app/src/presentation/components/setting_title.dart';
import 'package:weather_app/src/presentation/manager/app_cubit/app_cubit.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({Key? key}) : super(key: key);

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  late bool automaticUpdateTrue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppThemeData.appThemeData[AppTheme.Dark]!,
      child: CustomBottomModal(
        title: S.of(context).settings,
        titleColor: AppColors.primaryOrange,
        backgroundColor: AppColors.primaryBlue,
        height: bottomModalHeight(context),
        child: Container(
          constraints:
              const BoxConstraints(maxWidth: kMaxWidthConstraint * 1.2),
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(
                height: 16.0,
              ),
              //Theme
              SettingTitle(
                icon: Iconsax.moon,
                title: S.of(context).darkTheme,
                backgroundColor: Colors.black26,
                trailing: CupertinoSwitch(
                  activeColor: Theme.of(context).primaryColor,
                  value: Theme.of(context).brightness == Brightness.dark,
                  onChanged: (value) {
                    context.read<AppCubit>().toggleTheme();
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              //Font size
              SettingTitle(
                icon: Iconsax.text,
                title: S.of(context).fontSize,
                backgroundColor: Colors.black26,
                bottom: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 18,
                    ),
                    Text(
                      S.of(context).seoChangeFontSizeText,
                      style: textStyleBody.copyWith(
                          fontSize: context.read<AppCubit>().state.fontSize,
                          color: Colors.white),
                    ),
                    Slider(
                      activeColor: Theme.of(context).primaryColor,
                      value: context.read<AppCubit>().state.fontSize,
                      onChanged: (changeValue) {
                        context.read<AppCubit>().changeFontSize(changeValue);
                        setState(() {});
                      },
                      // divisions: 4,
                      min: 14,
                      max: 24,
                      label: '${context.read<AppCubit>().state.fontSize}',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
