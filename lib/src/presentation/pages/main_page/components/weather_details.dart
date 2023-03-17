import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:weather_app/src/data/models/weather_data/weather_data_model.dart';
import 'package:weather_app/src/presentation/app/lang/l10n.dart';
import 'package:weather_app/src/presentation/app/theme/dimensions.dart';
import 'package:weather_app/src/presentation/app/theme/text_styles.dart';
import 'package:weather_app/src/presentation/components/custom_card.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({
    Key? key,
    required this.weatherData,
  }) : super(key: key);

  final WeatherDataModel weatherData;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Iconsax.sun,
                  color: Theme.of(context).primaryColor,
                  size: 18,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  '${S.of(context).feelsLike}: ${weatherData.main?.feelsLike?.round()} °C',
                  style: textStyleBody.copyWith(
                    fontSize: kNormalFontSized,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Icon(
                  Iconsax.icon,
                  color: Theme.of(context).primaryColor,
                  size: 18,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  '${S.of(context).humidity}: ${weatherData.main?.humidity?.round()} %',
                  style: textStyleBody.copyWith(
                    fontSize: kNormalFontSized,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Icon(
                  Iconsax.settings,
                  color: Theme.of(context).primaryColor,
                  size: 18,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  '${S.of(context).pressure}: ${weatherData.main?.pressure?.round()} hPa',
                  style: textStyleBody.copyWith(
                    fontSize: kNormalFontSized,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Icon(
                  Iconsax.wind,
                  color: Theme.of(context).primaryColor,
                  size: 18,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  '${S.of(context).wind}: ${weatherData.wind?.speed?.round()} Km/h',
                  style: textStyleBody.copyWith(
                    fontSize: kNormalFontSized,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}