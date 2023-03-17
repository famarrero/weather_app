import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:weather_app/src/core/app_config/language.dart';
import 'package:weather_app/src/domain/repositories/app_repository.dart';
import 'package:weather_app/src/injector.dart';
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
    return CustomBottomModal(
      title: S.of(context).settings,
      height: bottomModalHeight(context),
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
          //Language
          SettingTitle(
            icon: Iconsax.translate,
            title: S.of(context).language,
            bottom: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                RadioListTile<Language>(
                  value: Language.es,
                  groupValue: injector<AppRepository>().currentLanguage,
                  onChanged: (changeValue) {
                    context
                        .read<AppCubit>()
                        .changeLanguage(changeValue ?? Language.es);
                    setState(() {});
                  },
                  title: Text(
                    Language.es.languageName,
                    style: textStyleBody,
                  ),
                  activeColor: Theme.of(context).primaryColor,
                ),
                RadioListTile<Language>(
                  value: Language.en,
                  groupValue: injector<AppRepository>().currentLanguage,
                  onChanged: (changeValue) {
                    context
                        .read<AppCubit>()
                        .changeLanguage(changeValue ?? Language.en);
                    setState(() {});
                  },
                  title: Text(
                    Language.en.languageName,
                    style: textStyleBody,
                  ),
                  activeColor: Theme.of(context).primaryColor,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          //Font size
          SettingTitle(
            icon: Iconsax.text,
            title: S.of(context).fontSize,
            bottom: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 18,
                ),
                Text(
                  S.of(context).changeFontSizeTextExample,
                  style: textStyleBody.copyWith(
                    fontSize: context.read<AppCubit>().state.fontSize,
                    color: Colors.white,
                  ),
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
    );
  }
}
