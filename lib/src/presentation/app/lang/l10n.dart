// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `WeatherApp`
  String get appName {
    return Intl.message(
      'WeatherApp',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get version {
    return Intl.message(
      'Version',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Development options`
  String get developmentOptions {
    return Intl.message(
      'Development options',
      name: 'developmentOptions',
      desc: '',
      args: [],
    );
  }

  /// `No data`
  String get noData {
    return Intl.message(
      'No data',
      name: 'noData',
      desc: '',
      args: [],
    );
  }

  /// `Error ocurred`
  String get errorOcurred {
    return Intl.message(
      'Error ocurred',
      name: 'errorOcurred',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Press again to exit`
  String get pressAgainToExit {
    return Intl.message(
      'Press again to exit',
      name: 'pressAgainToExit',
      desc: '',
      args: [],
    );
  }

  /// `Font size`
  String get fontSize {
    return Intl.message(
      'Font size',
      name: 'fontSize',
      desc: '',
      args: [],
    );
  }

  /// `This is a text for change the font size`
  String get changeFontSizeTextExample {
    return Intl.message(
      'This is a text for change the font size',
      name: 'changeFontSizeTextExample',
      desc: '',
      args: [],
    );
  }

  /// `Dark theme`
  String get darkTheme {
    return Intl.message(
      'Dark theme',
      name: 'darkTheme',
      desc: '',
      args: [],
    );
  }

  /// `Tap to retry`
  String get tapToRetry {
    return Intl.message(
      'Tap to retry',
      name: 'tapToRetry',
      desc: '',
      args: [],
    );
  }

  /// `Check your internet connection`
  String get checkYourInternetConnection {
    return Intl.message(
      'Check your internet connection',
      name: 'checkYourInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Internal server error`
  String get internalServerError {
    return Intl.message(
      'Internal server error',
      name: 'internalServerError',
      desc: '',
      args: [],
    );
  }

  /// `Gateway error`
  String get badGateway {
    return Intl.message(
      'Gateway error',
      name: 'badGateway',
      desc: '',
      args: [],
    );
  }

  /// `Service unavailable`
  String get serviceUnavailable {
    return Intl.message(
      'Service unavailable',
      name: 'serviceUnavailable',
      desc: '',
      args: [],
    );
  }

  /// `Gateway time out`
  String get gatewayTimeOut {
    return Intl.message(
      'Gateway time out',
      name: 'gatewayTimeOut',
      desc: '',
      args: [],
    );
  }

  /// `Unknown server error`
  String get unknownConnectionErrorFromApi {
    return Intl.message(
      'Unknown server error',
      name: 'unknownConnectionErrorFromApi',
      desc: '',
      args: [],
    );
  }

  /// `From server`
  String get fromApi {
    return Intl.message(
      'From server',
      name: 'fromApi',
      desc: '',
      args: [],
    );
  }

  /// `Null response from server`
  String get nullResponseForServer {
    return Intl.message(
      'Null response from server',
      name: 'nullResponseForServer',
      desc: '',
      args: [],
    );
  }

  /// `Invalid token`
  String get invalidToken {
    return Intl.message(
      'Invalid token',
      name: 'invalidToken',
      desc: '',
      args: [],
    );
  }

  /// `Nothing found`
  String get nothingFound {
    return Intl.message(
      'Nothing found',
      name: 'nothingFound',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorized`
  String get unauthorized {
    return Intl.message(
      'Unauthorized',
      name: 'unauthorized',
      desc: '',
      args: [],
    );
  }

  /// `Search city`
  String get searchCity {
    return Intl.message(
      'Search city',
      name: 'searchCity',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Field required`
  String get fieldRequired {
    return Intl.message(
      'Field required',
      name: 'fieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `No results found`
  String get noResultsFound {
    return Intl.message(
      'No results found',
      name: 'noResultsFound',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `State`
  String get state {
    return Intl.message(
      'State',
      name: 'state',
      desc: '',
      args: [],
    );
  }

  /// `Country code`
  String get countryCode {
    return Intl.message(
      'Country code',
      name: 'countryCode',
      desc: '',
      args: [],
    );
  }

  /// `My cities`
  String get myCities {
    return Intl.message(
      'My cities',
      name: 'myCities',
      desc: '',
      args: [],
    );
  }

  /// `Error deleting the city in the database`
  String get errorDeleteCityInDB {
    return Intl.message(
      'Error deleting the city in the database',
      name: 'errorDeleteCityInDB',
      desc: '',
      args: [],
    );
  }

  /// `Error saving city in database`
  String get errorSaveCityInDB {
    return Intl.message(
      'Error saving city in database',
      name: 'errorSaveCityInDB',
      desc: '',
      args: [],
    );
  }

  /// `Error setting default city`
  String get errorChangeTheCurrentCity {
    return Intl.message(
      'Error setting default city',
      name: 'errorChangeTheCurrentCity',
      desc: '',
      args: [],
    );
  }

  /// `Show on map`
  String get showInMap {
    return Intl.message(
      'Show on map',
      name: 'showInMap',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to see this city on the map?`
  String get showInMapThisCity {
    return Intl.message(
      'Do you want to see this city on the map?',
      name: 'showInMapThisCity',
      desc: '',
      args: [],
    );
  }

  /// `Delete this city`
  String get deleteThisCity {
    return Intl.message(
      'Delete this city',
      name: 'deleteThisCity',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to delete this city?`
  String get doYouWantDeleteThisCity {
    return Intl.message(
      'Do you want to delete this city?',
      name: 'doYouWantDeleteThisCity',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `City has no coordinates`
  String get cityHasNotCoordinates {
    return Intl.message(
      'City has no coordinates',
      name: 'cityHasNotCoordinates',
      desc: '',
      args: [],
    );
  }

  /// `You haven't selected any city yet`
  String get noCurrentCitySelectedYet {
    return Intl.message(
      'You haven\'t selected any city yet',
      name: 'noCurrentCitySelectedYet',
      desc: '',
      args: [],
    );
  }

  /// `Add a city to check its weather`
  String get addACityToConsultHisWeather {
    return Intl.message(
      'Add a city to check its weather',
      name: 'addACityToConsultHisWeather',
      desc: '',
      args: [],
    );
  }

  /// `Add a city`
  String get addCity {
    return Intl.message(
      'Add a city',
      name: 'addCity',
      desc: '',
      args: [],
    );
  }

  /// `5 day forecast`
  String get fiveDayForecast {
    return Intl.message(
      '5 day forecast',
      name: 'fiveDayForecast',
      desc: '',
      args: [],
    );
  }

  /// `Body Feeling`
  String get feelsLike {
    return Intl.message(
      'Body Feeling',
      name: 'feelsLike',
      desc: '',
      args: [],
    );
  }

  /// `Humidity`
  String get humidity {
    return Intl.message(
      'Humidity',
      name: 'humidity',
      desc: '',
      args: [],
    );
  }

  /// `Atmospheric pressure`
  String get pressure {
    return Intl.message(
      'Atmospheric pressure',
      name: 'pressure',
      desc: '',
      args: [],
    );
  }

  /// `Wind`
  String get wind {
    return Intl.message(
      'Wind',
      name: 'wind',
      desc: '',
      args: [],
    );
  }

  /// `Sunrise`
  String get sunrise {
    return Intl.message(
      'Sunrise',
      name: 'sunrise',
      desc: '',
      args: [],
    );
  }

  /// `Sunset`
  String get sunset {
    return Intl.message(
      'Sunset',
      name: 'sunset',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
