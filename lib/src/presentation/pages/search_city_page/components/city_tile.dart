import 'package:flutter/material.dart';
import 'package:weather_app/src/core/exports/lang.dart';
import 'package:weather_app/src/data/models/city/city_model.dart';
import 'package:weather_app/src/presentation/components/custom_card.dart';

class CityTile extends StatelessWidget {
  const CityTile({
    Key? key,
    required this.city,
  }) : super(key: key);

  final CityModel city;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        children: [
          Text(city.name ?? S.of(context).noData),
        ],
      ),
    );
  }
}
