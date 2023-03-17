import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:weather_app/src/core/utils/date_utils.dart';
import 'package:weather_app/src/data/models/weather_data/weather_data_model.dart';
import 'package:weather_app/src/presentation/app/lang/l10n.dart';
import 'package:weather_app/src/presentation/components/custom_card.dart';

class SunDetails extends StatelessWidget {
  const SunDetails({
    Key? key,
    required this.weatherData,
  }) : super(key: key);

  final WeatherDataModel weatherData;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(S.of(context).sunrise),
                Icon(
                  Iconsax.sun_1,
                  color: Theme.of(context).primaryColor,
                ),
                Text(
                  DateTime.fromMicrosecondsSinceEpoch(
                    weatherData.sys?.sunrise ?? 1,
                  ).toFormattedTime,
                ),
              ],
            ),
            const Spacer(),
            const Text('--------------'),
            const Spacer(),
            Column(
              children: [
                Text(S.of(context).sunset),
                Icon(
                  Iconsax.sun_fog,
                  color: Theme.of(context).primaryColor,
                ),
                Text(
                  DateTime.fromMicrosecondsSinceEpoch(
                    weatherData.sys?.sunset ?? 1,
                  ).toFormattedTime,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
