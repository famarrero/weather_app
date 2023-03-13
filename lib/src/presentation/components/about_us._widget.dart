import 'package:flutter/material.dart';
import 'package:weather_app/src/core/exports/assets.dart';
import 'package:weather_app/src/core/exports/lang.dart';
import 'package:weather_app/src/core/services_manager/package_info_service.dart';
import 'package:weather_app/src/injector.dart';
import 'package:weather_app/src/presentation/app/theme/text_styles.dart';

class AboutUsWidget extends StatelessWidget {
  const AboutUsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        Image.asset(
          Assets.images.isotypeWeatherApp.path,
          height: 60,
          width: 60,
        ),
        const SizedBox(
          height: 24.0,
        ),
        Text(
          S.of(context).appName,
          style: textStyleBody.copyWith(fontSize: 14),
          textAlign: TextAlign.center,
        ),
        Text(
          injector<PackageInfoService>().getAppVersion(),
          style: textStyleBody.copyWith(fontSize: 14),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 24.0,
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: textStyleTitle.copyWith(
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
            children: <TextSpan>[
              TextSpan(
                text: '${S.current.appName}: ',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
