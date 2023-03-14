import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:weather_app/src/core/exports/lang.dart';
import 'package:weather_app/src/core/services_manager/url_launcher_service.dart';
import 'package:weather_app/src/domain/entities/city/city_entity.dart';
import 'package:weather_app/src/injector.dart';
import 'package:weather_app/src/presentation/app/theme/colors.dart';
import 'package:weather_app/src/presentation/app/theme/dimensions.dart';
import 'package:weather_app/src/presentation/app/theme/text_styles.dart';
import 'package:weather_app/src/presentation/components/custom_card.dart';
import 'package:weather_app/src/presentation/components/custom_dialog_box.dart';
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
      onTap: () {
        context.read<CitiesManageCubit>().setCityAsCurrentById(city);
      },
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      backgroundColor:
          city.current == true ? AppColors.secondaryColorLight : null,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4.0, 12.0, 6.0, 12.0),
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
            Visibility(
              visible: city.current != true,
              child: IconButton(
                splashRadius: 20,
                onPressed: () {
                  CustomDialogs().customDialogInformation(
                    context: context,
                    title: S.of(context).deleteThisCity,
                    message: S.of(context).doYouWantDeleteThisCity,
                    buttonPositiveName: S.of(context).delete,
                    buttonPositiveAction: () {
                      context.read<CitiesManageCubit>().deleteCityInDB(city);
                      Navigator.of(context).pop();
                    },
                    buttonNegativeName: S.of(context).cancel,
                  );
                },
                icon: const Icon(
                  Iconsax.trash,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
