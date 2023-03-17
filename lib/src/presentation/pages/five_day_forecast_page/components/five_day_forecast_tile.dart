import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:weather_app/src/data/models/weather_data/weather_data_model.dart';
import 'package:weather_app/src/presentation/app/theme/dimensions.dart';
import 'package:weather_app/src/presentation/app/theme/text_styles.dart';

class FiveDayForecastTile extends StatelessWidget {
  const FiveDayForecastTile({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final WeatherDataModel weather;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Iconsax.calendar_1,
                size: 16,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(width: 4.0),
              Text(weather.dtTxt ?? '--'),
            ],
          ),
          const SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  if (weather.weather?.first.icon != null)
                    Image.network(
                      'https://openweathermap.org/img/wn/${weather.weather?.first.icon}@2x.png',
                      height: 50,
                      width: 50,
                      errorBuilder: (context, error, stackTrace) =>
                          const SizedBox(),
                    ),
                  Text(
                    weather.weather?.first.main ?? '',
                    style: textStyleTitle.copyWith(fontSize: kBigFontSized),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    weather.main?.temp?.round().toString() ?? '',
                    style:
                        textStyleTitle.copyWith(fontSize: kBigFontSized * 1.4),
                  ),
                  const Text('°C'),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Iconsax.arrow_up_3,
                    size: 14,
                  ),
                  const SizedBox(width: 4.0),
                  Text('${weather.main?.tempMax?.round()}'),
                  const Text('°C')
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Iconsax.arrow_down,
                    size: 14,
                  ),
                  const SizedBox(width: 4.0),
                  Text('${weather.main?.tempMin?.round()}'),
                  const Text('°C')
                ],
              )
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
