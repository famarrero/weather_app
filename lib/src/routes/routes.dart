import 'package:auto_route/annotations.dart';
import 'package:weather_app/src/presentation/pages/cities_manage_page/cities_manage_page.dart';
import 'package:weather_app/src/presentation/pages/five_day_forecast_page/five_day_forecast_page.dart';
import 'package:weather_app/src/presentation/pages/main_page/main_page.dart';
import 'package:weather_app/src/presentation/pages/search_city_page/search_city_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute<dynamic>(
      page: MainPage,
      initial: true,
      children: [
        AutoRoute<dynamic>(page: CitiesManagePage),
        AutoRoute<dynamic>(page: FiveDayForecastPage),
        AutoRoute<dynamic>(page: SearchCityPage),
      ],
    ),
  ],
)
class $AppRouter {}

// run this when modify this file
// flutter packages pub run build_runner build
