import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:weather_app/src/core/services_manager/package_info_service.dart';
import 'package:weather_app/src/injector.dart';
import 'package:weather_app/src/presentation/app/assets/assets.gen.dart';
import 'package:weather_app/src/presentation/app/lang/l10n.dart';
import 'package:weather_app/src/presentation/app/theme/colors.dart';
import 'package:weather_app/src/presentation/app/theme/text_styles.dart';
import 'package:weather_app/src/presentation/components/settings_widget.dart';
import 'package:weather_app/src/presentation/components/side_bar/sidebar_menu_item.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = S.of(context);
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: double.infinity,
      decoration: _buildDecoration(context),
      child: ListView(
        children: [
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Image.asset(
              Assets.images.isotypeWeatherApp.path,
              height: 60,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            injector<PackageInfoService>().getAppVersion(),
            style: textStyleBody.copyWith(color: Colors.white, fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 24,
          ),       
          SideBarMenuItem(
            text: localizations.settings,
            icon: Iconsax.settings,
            onPressed: () {
              Navigator.of(context).pop();
              showModalBottomSheet<dynamic>(
                backgroundColor: Colors.transparent,
                elevation: 0,
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return const SettingsWidget();
                },
              );
            },
          ),          
        ],
      ),
    );
  }

  BoxDecoration _buildDecoration(BuildContext context) {
    return const BoxDecoration(
      color: AppColors.primaryBlue,
      // boxShadow: [
      //   BoxShadow(color: AppColors.blue, blurRadius: 10),
      // ],
    );
  }
}
