import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:weather_app/src/core/exports/lang.dart';
import 'package:weather_app/src/core/services_manager/url_launcher_service.dart';
import 'package:weather_app/src/domain/entities/city/city_entity.dart';
import 'package:weather_app/src/injector.dart';
import 'package:weather_app/src/presentation/app/theme/dimensions.dart';
import 'package:weather_app/src/presentation/app/theme/text_styles.dart';
import 'package:weather_app/src/presentation/components/custom_card.dart';
import 'package:weather_app/src/presentation/pages/cities_manage_page/cubit/cities_manage_cubit.dart';

class CityManageTile extends StatelessWidget {
  const CityManageTile({
    Key? key,
    required this.city,
  }) : super(key: key);

  final CityEntity city;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: () {},
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).name,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
                Text(
                  city.name ?? S.of(context).noData,
                  style: textStyleBody.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: kBigFontSized,
                  ),
                ),
                Text(
                  S.of(context).state,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
                Text(city.state ?? S.of(context).noData),
                Text(
                  S.of(context).countryCode,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
                Text(city.country ?? S.of(context).noData),
              ],
            ),
            const Spacer(),
            if (city.lat != null && city.lon != null)
              IconButton(
                splashRadius: 20,
                onPressed: () {
                  injector<UrlLauncherService>()
                      .launchMaps(city.lat!, city.lon!);
                },
                icon: const Icon(Iconsax.map),
              ),
            const SizedBox(
              width: 4.0,
            ),
            IconButton(
              splashRadius: 20,
              onPressed: () {
                context.read<CitiesManageCubit>().deleteCityInDB(city);
              },
              icon: const Icon(
                Iconsax.trash,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
