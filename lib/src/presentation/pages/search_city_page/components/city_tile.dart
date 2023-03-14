import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:weather_app/src/core/exports/lang.dart';
import 'package:weather_app/src/core/services_manager/url_launcher_service.dart';
import 'package:weather_app/src/data/models/city/city_model.dart';
import 'package:weather_app/src/injector.dart';
import 'package:weather_app/src/presentation/app/theme/dimensions.dart';
import 'package:weather_app/src/presentation/app/theme/text_styles.dart';
import 'package:weather_app/src/presentation/components/custom_card.dart';
import 'package:weather_app/src/presentation/components/custom_dialog_box.dart';
import 'package:weather_app/src/presentation/pages/search_city_page/cubit/search_city_cubit.dart';

class CityTile extends StatelessWidget {
  const CityTile({
    Key? key,
    required this.city,
  }) : super(key: key);

  final CityModel city;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: () {
        context.read<SearchCityCubit>().insertCityInDB(city);
      },
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4.0, 12.0, 16.0, 12.0),
        child: Row(
          children: [
            if (city.lat != null && city.lon != null)
              IconButton(
                splashRadius: 20,
                onPressed: () {
                  CustomDialogs().customDialogInformation(
                    context: context,
                    title: S.of(context).showInMap,
                    message: S.of(context).showInMapThisCity,
                    buttonPositiveName: S.of(context).ok,
                    buttonPositiveAction: () {
                      injector<UrlLauncherService>()
                          .launchMaps(city.lat!, city.lon!);
                    },
                    buttonNegativeName: S.of(context).cancel,
                  );
                },
                icon: const Icon(Iconsax.map),
              ),
            Expanded(
              child: Column(
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
            ),
            // const Spacer(),
            const Icon(Iconsax.add),
           
          ],
        ),
      ),
    );
  }
}
