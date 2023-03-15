import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:oktoast/oktoast.dart';
import 'package:weather_app/src/core/failure/failures.dart';
import 'package:weather_app/src/injector.dart';
import 'package:weather_app/src/presentation/app/lang/l10n.dart';
import 'package:weather_app/src/presentation/app/theme/colors.dart';
import 'package:weather_app/src/presentation/app/theme/dimensions.dart';
import 'package:weather_app/src/presentation/app/theme/text_styles.dart';
import 'package:weather_app/src/presentation/components/empty_view_info_widget.dart';
import 'package:weather_app/src/presentation/components/failure_widget.dart';
import 'package:weather_app/src/presentation/components/loading.dart';
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
      color: AppColors.secondaryColor,
      child: SafeArea(
        child: Scaffold(
          key: context.read<MainCubit>().scaffoldKey,
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  AutoRouter.of(context).push(const CitiesManagePageRoute());
                },
                icon: const Icon(Iconsax.add),
              )
            ],
          ),
          drawer: const SideBar(),
          body: BlocBuilder<MainCubit, MainState>(
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
                return Column(
                  children: [
                    Text(
                      weatherData.name ?? '',
                      style: textStyleTitle.copyWith(
                        fontSize: kBigFontSized * 1.4,
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
                            fontSize: kBigFontSized * 5,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '°C',
                          style: textStyleTitle.copyWith(
                            fontSize: kBigFontSized * 2,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
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
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
