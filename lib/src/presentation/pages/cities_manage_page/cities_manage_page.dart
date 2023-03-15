import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:weather_app/src/core/utils/react_to_failure_snackbar.dart';
import 'package:weather_app/src/domain/entities/city/city_entity.dart';
import 'package:weather_app/src/injector.dart';
import 'package:weather_app/src/presentation/app/lang/l10n.dart';
import 'package:weather_app/src/presentation/app/theme/dimensions.dart';
import 'package:weather_app/src/presentation/components/custom_back_button.dart';
import 'package:weather_app/src/presentation/components/empty_view_info_widget.dart';
import 'package:weather_app/src/presentation/components/loading.dart';
import 'package:weather_app/src/presentation/pages/cities_manage_page/components/city_manage_tile.dart';
import 'package:weather_app/src/presentation/pages/cities_manage_page/cubit/cities_manage_cubit.dart';
import 'package:weather_app/src/presentation/pages/main_page/cubit/main_cubit.dart';
import 'package:weather_app/src/routes/routes.gr.dart';

class CitiesManagePage extends StatefulWidget {
  const CitiesManagePage({Key? key}) : super(key: key);

  @override
  State<CitiesManagePage> createState() => _CitiesManagePageState();
}

class _CitiesManagePageState extends State<CitiesManagePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CitiesManageCubit(injector()),
      child: BlocConsumer<CitiesManageCubit, CitiesManageState>(
        listener: (context, state) {
          if (state.setCityAsCurrent.failure != null) {
            context.reactToFailureWithSnackBar(
              failure: state.setCityAsCurrent.failure,
            );
          }
          if (state.setCityAsCurrent.data == true) {
            context.read<MainCubit>().getWeatherDataByCityCoord();
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(S.of(context).myCities),
              centerTitle: true,
              leading: const CustomBackButton(),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPagePadding),
              child: Column(
                children: [
                  const SearchCityButton(),
                  const SizedBox(height: 24.0),
                  Expanded(
                    child: _buildMyCitiesStream(state.myCities.listData),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  StreamBuilder<List<CityEntity>> _buildMyCitiesStream(
    Stream<List<CityEntity>> cities,
  ) {
    return StreamBuilder(
      stream: cities,
      builder: (
        context,
        AsyncSnapshot<List<CityEntity>> snapshot,
      ) {
        if (snapshot.hasData) {
          if (snapshot.data != null && snapshot.data!.isNotEmpty) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                final CityEntity city = snapshot.data![index];
                return CityManageTile(city: city);
              },
            );
          } else {
            return EmptyViewInfoWidget(
              iconData: Iconsax.search_normal_1,
              title: S.of(context).noResultsFound,
            );
          }
        } else if (snapshot.hasError) {
          return EmptyViewInfoWidget(
            iconData: Iconsax.warning_2,
            title: S.of(context).errorOcurred,
          );
        } else {
          return const Center(child: CustomCircularLoadingIndicator());
        }
      },
    );
  }
}

class SearchCityButton extends StatelessWidget {
  const SearchCityButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      borderRadius: BorderRadius.circular(kCorner),
      onTap: () {
        AutoRouter.of(context).push(const SearchCityPageRoute());
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.withOpacity(0.6),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(kCorner),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Icon(
                Iconsax.search_normal,
                color: Colors.grey.withOpacity(0.9),
              ),
              const SizedBox(
                width: 14.0,
              ),
              Text(
                S.of(context).searchCity,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: 16,
                      color: Colors.grey.withOpacity(0.9),
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
