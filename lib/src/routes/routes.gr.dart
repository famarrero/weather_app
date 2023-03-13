// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../presentation/pages/cities_manage_page/cities_manage_page.dart'
    as _i2;
import '../presentation/pages/five_day_forecast_page/five_day_forecast_page.dart'
    as _i3;
import '../presentation/pages/main_page/main_page.dart' as _i1;
import '../presentation/pages/search_city_page/search_city_page.dart' as _i4;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    MainPageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MainPage(),
      );
    },
    CitiesManagePageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.CitiesManagePage(),
      );
    },
    FiveDayForecastPageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.FiveDayForecastPage(),
      );
    },
    SearchCityPageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.SearchCityPage(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          MainPageRoute.name,
          path: '/',
        ),
        _i5.RouteConfig(
          CitiesManagePageRoute.name,
          path: '/cities-manage-page',
        ),
        _i5.RouteConfig(
          FiveDayForecastPageRoute.name,
          path: '/five-day-forecast-page',
        ),
        _i5.RouteConfig(
          SearchCityPageRoute.name,
          path: '/search-city-page',
        ),
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainPageRoute extends _i5.PageRouteInfo<void> {
  const MainPageRoute()
      : super(
          MainPageRoute.name,
          path: '/',
        );

  static const String name = 'MainPageRoute';
}

/// generated route for
/// [_i2.CitiesManagePage]
class CitiesManagePageRoute extends _i5.PageRouteInfo<void> {
  const CitiesManagePageRoute()
      : super(
          CitiesManagePageRoute.name,
          path: '/cities-manage-page',
        );

  static const String name = 'CitiesManagePageRoute';
}

/// generated route for
/// [_i3.FiveDayForecastPage]
class FiveDayForecastPageRoute extends _i5.PageRouteInfo<void> {
  const FiveDayForecastPageRoute()
      : super(
          FiveDayForecastPageRoute.name,
          path: '/five-day-forecast-page',
        );

  static const String name = 'FiveDayForecastPageRoute';
}

/// generated route for
/// [_i4.SearchCityPage]
class SearchCityPageRoute extends _i5.PageRouteInfo<void> {
  const SearchCityPageRoute()
      : super(
          SearchCityPageRoute.name,
          path: '/search-city-page',
        );

  static const String name = 'SearchCityPageRoute';
}
