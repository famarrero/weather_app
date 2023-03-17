import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:weather_app/src/injector.dart';
import 'package:weather_app/src/presentation/app/lang/l10n.dart';
import 'package:weather_app/src/presentation/app/theme/dimensions.dart';
import 'package:weather_app/src/presentation/components/custom_back_button.dart';
import 'package:weather_app/src/presentation/components/failure_widget.dart';
import 'package:weather_app/src/presentation/components/loading.dart';
import 'package:weather_app/src/presentation/pages/five_day_forecast_page/components/five_day_forecast_tile.dart';
import 'package:weather_app/src/presentation/pages/five_day_forecast_page/cubit/five_day_forecast_cubit.dart';

class FiveDayForecastPage extends StatelessWidget {
  const FiveDayForecastPage({
    Key? key,
    required this.lat,
    required this.lon,
  }) : super(key: key);

  final double lat;
  final double lon;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FiveDayForecastCubit(
        injector(),
        lat,
        lon,
      ),
      child: Builder(
        builder: (context) {
          return ColoredBox(
            color: Theme.of(context).primaryColor,
            child: SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  leading: const CustomBackButton(),
                  title: Text(S.of(context).fiveDayForecast),
                  centerTitle: true,
                  actions: [
                    IconButton(
                      splashRadius: 20,
                      onPressed: () {
                        context.read<FiveDayForecastCubit>().sortWeathersDataByTemp();
                      },
                      icon: const Icon(Iconsax.sort),
                    )
                  ],
                ),
                body: const FiveDayForecastContent(),
              ),
            ),
          );
        },
      ),
    );
  }
}

class FiveDayForecastContent extends StatelessWidget {
  const FiveDayForecastContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPagePadding),
      child: BlocConsumer<FiveDayForecastCubit, FiveDayForecastState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.weathersData.isLoading) {
            return const CustomCircularLoadingIndicator();
          } else if (state.weathersData.failure != null) {
            return FailureWidget(
              title: S.of(context).errorOcurred,
              subtitle: state.weathersData.failure?.message ?? '--',
              retry: () => context
                  .read<FiveDayForecastCubit>()
                  .getFiveDayForecastByCityCoord(),
            );
          }
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.weathersData.listData.length,
            itemBuilder: (context, index) {
              final weather = state.weathersData.listData[index];
              return FiveDayForecastTile(
                weather: weather,
              );
            },
          );
        },
      ),
    );
  }
}
