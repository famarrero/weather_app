import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:oktoast/oktoast.dart';
import 'package:weather_app/src/core/failure/failures.dart';
import 'package:weather_app/src/core/utils/date_utils.dart';
import 'package:weather_app/src/data/models/weather_data/weather_data_model.dart';
import 'package:weather_app/src/presentation/app/lang/l10n.dart';
import 'package:weather_app/src/presentation/app/theme/dimensions.dart';
import 'package:weather_app/src/presentation/app/theme/text_styles.dart';
import 'package:weather_app/src/presentation/components/custom_card.dart';
import 'package:weather_app/src/presentation/components/empty_view_info_widget.dart';
import 'package:weather_app/src/presentation/components/failure_widget.dart';
import 'package:weather_app/src/presentation/components/loading.dart';
import 'package:weather_app/src/presentation/components/primary_btn.dart';
import 'package:weather_app/src/presentation/pages/main_page/components/side_bar/side_bar.dart';
import 'package:weather_app/src/presentation/pages/main_page/cubit/main_cubit.dart';
import 'package:weather_app/src/routes/routes.gr.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DateTime? _currentBackPressedTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: const MainPageContent(),
    );
  }

  Future<bool> onWillPop() async {
    final DateTime now = DateTime.now();
    if (_currentBackPressedTime == null ||
        now.difference(_currentBackPressedTime!) > const Duration(seconds: 2)) {
      _currentBackPressedTime = now;
      showToast(
        S.of(context).pressAgainToExit,
        duration: const Duration(seconds: 2),
        position: ToastPosition.bottom,
        backgroundColor: Colors.black.withOpacity(0.7),
      );
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}

class MainPageContent extends StatelessWidget {
  const MainPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          key: context.read<MainCubit>().scaffoldKey,
          appBar: AppBar(
            actions: [
              IconButton(
                splashRadius: 20,
                tooltip: S.of(context).addCity,
                onPressed: () {
                  AutoRouter.of(context).push(const CitiesManagePageRoute());
                },
                icon: const Icon(Iconsax.add),
              )
            ],
          ),
          drawer: const SideBar(),
          body: Padding(
            padding: const EdgeInsets.all(kPagePadding),
            child: BlocBuilder<MainCubit, MainState>(
              builder: (context, state) {
                if (state.weatherData.isLoading) {
                  return const CustomCircularLoadingIndicator();
                } else if (state.weatherData.failure != null) {
                  if (state.weatherData.failure is NoCurrentCityFailure) {
                    return EmptyViewInfoWidget(
                      iconData: Iconsax.add,
                      title: S.of(context).noCurrentCitySelectedYet,
                      subtitle: S.of(context).addACityToConsultHisWeather,
                      onTap: () {
                        AutoRouter.of(context)
                            .push(const CitiesManagePageRoute());
                      },
                    );
                  } else {
                    return FailureWidget(
                      title: S.of(context).errorOcurred,
                      subtitle: state.weatherData.failure?.message ?? '--',
                      retry: () =>
                          context.read<MainCubit>().getWeatherDataByCityCoord(),
                    );
                  }
                } else if (state.weatherData.data != null) {
                  final weatherData = state.weatherData.data!;
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        MainTemDetails(weatherData: weatherData),
                        const SizedBox(
                          height: 52.0,
                        ),
                        WeatherDetails(weatherData: weatherData),
                        const SizedBox(
                          height: 24.0,
                        ),
                        SunDetails(weatherData: weatherData),
                        const SizedBox(
                          height: 52.0,
                        ),
                        CustomOutlineButton(
                          text: S.of(context).fiveDayForecast,
                          onPressed: () {},
                        )
                      ],
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class MainTemDetails extends StatelessWidget {
  const MainTemDetails({
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
            if (weatherData.weather?.first.icon != null)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Image.network(
                  'https://openweathermap.org/img/wn/${weatherData.weather?.first.icon}@2x.png',
                  height: 80,
                  width: 80,
                ),
              ),
          ],
        ),
        const SizedBox(
          height: 24.0,
        ),
        Text(
          weatherData.weather?.first.description ?? '',
          style: textStyleTitle.copyWith(
            fontSize: kBigFontSized * 1.4,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

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
            const Text('------------------------------------'),
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
