import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:weather_app/src/core/utils/date_utils.dart';
import 'package:weather_app/src/data/models/weather_data/weather_data_model.dart';
import 'package:weather_app/src/presentation/app/theme/dimensions.dart';
import 'package:weather_app/src/presentation/app/theme/text_styles.dart';

class MainTempDetails extends StatelessWidget {
  const MainTempDetails({
    Key? key,
    required this.weatherData,
  }) : super(key: key);

  final WeatherDataModel weatherData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          weatherData.name ?? '',
          style: textStyleTitle.copyWith(
            fontSize: kBigFontSized * 1.4,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          DateTime.fromMicrosecondsSinceEpoch(
            weatherData.dt ?? 1,
          ).toFormattedDate,
          style: textStyleTitle.copyWith(
            fontSize: kNormalFontSized,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 52.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              weatherData.main?.temp?.round().toString() ?? '',
              style: textStyleTitle.copyWith(
                fontSize: kBigFontSized * 7.8,
                fontWeight: FontWeight.w200,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              '°C',
              style: textStyleTitle.copyWith(
                fontSize: kBigFontSized * 2,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (weatherData.weather?.first.icon != null)
                  Image.network(
                    'https://openweathermap.org/img/wn/${weatherData.weather?.first.icon}@2x.png',
                    height: 60,
                    width: 60,
                    errorBuilder: (context, error, stackTrace) =>
                        const SizedBox(),
                  ),
                SizedBox(
                  width: 52,
                  child: Row(
                    children: [
                      const Icon(
                        Iconsax.arrow_up_3,
                        size: 14,
                      ),
                      const SizedBox(width: 4.0),
                      Text('${weatherData.main?.tempMax?.round()}'),
                      const Spacer(),
                      const Text('°C')
                    ],
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                SizedBox(
                  width: 52,
                  child: Row(
                    children: [
                      const Icon(
                        Iconsax.arrow_down,
                        size: 14,
                      ),
                      const SizedBox(width: 4.0),
                      Text('${weatherData.main?.tempMin?.round()}'),
                      const Spacer(),
                      const Text('°C')
                    ],
                  ),
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 24.0,
        ),
        Text(
          weatherData.weather?.first.main ?? '',
          style: textStyleTitle.copyWith(
            fontSize: kBigFontSized * 1.4,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}