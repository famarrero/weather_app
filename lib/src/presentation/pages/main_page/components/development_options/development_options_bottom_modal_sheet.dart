import 'package:dio_logs_manager/dio_logs_manager.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:weather_app/src/core/services_manager/package_info_service.dart';
import 'package:weather_app/src/core/utils/env_config.dart';
import 'package:weather_app/src/data/data_sources/local/database/drift_database.dart';
import 'package:weather_app/src/injector.dart';
import 'package:weather_app/src/presentation/app/lang/l10n.dart';
import 'package:weather_app/src/presentation/app/theme/text_styles.dart';
import 'package:weather_app/src/presentation/components/bottom_modal_sheet.dart';
import 'package:weather_app/src/presentation/components/setting_title.dart';
import 'package:weather_app/src/presentation/manager/app_cubit/app_cubit.dart';

class DevelopmentOptionsBottomModalSheet extends StatefulWidget {
  const DevelopmentOptionsBottomModalSheet({Key? key}) : super(key: key);

  @override
  State<DevelopmentOptionsBottomModalSheet> createState() =>
      _DevelopmentOptionsBottomModalSheetState();
}

class _DevelopmentOptionsBottomModalSheetState
    extends State<DevelopmentOptionsBottomModalSheet> {
  @override
  Widget build(BuildContext context) {
    return CustomBottomModal(
      title: S.of(context).developmentOptions,
      child: _buildSettings(context),
    );
  }

  ListView _buildSettings(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        const SizedBox(
          height: 12,
        ),
        Text(
          'ENVIRONMENT: ${injector<EnvironmentInfo>().environment}',
          style: textStyleTitle,
          textAlign: TextAlign.center,
        ),
        Text(
          '${injector<PackageInfoService>().getAppName()}  v${injector<PackageInfoService>().getAppVersion()}',
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 12,
        ),

        //Device preview frame
        SettingTitle(
          icon: Icons.mobile_friendly,
          title: 'Device preview frame',
          trailing: CupertinoSwitch(
            activeColor: Theme.of(context).primaryColor,
            value: context.read<AppCubit>().state.devicePreviewFrame,
            onChanged: (value) {
              context.read<AppCubit>().toggleDevicePreviewFrame();
            },
          ),
        ),
        const SizedBox(
          height: 12,
        ),

        //Toggle debug Http API Call
        SettingTitle(
          icon: Icons.wifi,
          title: 'Toggle debug Http API Call',
          onPressed: () {
            if (!debugBtnIsShow()) {
              showDebugBtn(context);
            } else {
              dismissDebugBtn();
            }
          },
        ),
        const SizedBox(
          height: 12,
        ),

        //Database inspector
        SettingTitle(
          title: 'Database inspector',
          icon: Iconsax.data,
          onPressed: () {
            Navigator.of(context).push<dynamic>(
              MaterialPageRoute<dynamic>(
                builder: (context) => DriftDbViewer(injector<AppDatabase>()),
              ),
            );
          },
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
