import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/src/core/failure/failures.dart';
import 'package:weather_app/src/core/utils/base_state.dart';
import 'package:weather_app/src/data/models/weather_data/weather_data_model.dart';
import 'package:weather_app/src/domain/repositories/city_database_repository.dart';
import 'package:weather_app/src/domain/repositories/remote_repository.dart';
import 'package:weather_app/src/presentation/app/lang/l10n.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit(
    this._remoteRepository,
    this._cityDatabaseRepository,
  ) : super(MainState.initial()) {
    getWeatherDataByCityCoord();
  }

  final RemoteRepository _remoteRepository;
  final CityDatabaseRepository _cityDatabaseRepository;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void openMobilDrawable() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
      emit(state.copyWith(isDrawerOpen: true));
    }
  }

  void closeMobileDrawable() {
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.closeDrawer();
      emit(state.copyWith(isDrawerOpen: false));
    }
  }

  Future<void> getWeatherDataByCityCoord() async {
    emit(
      state.copyWith(
        weatherData: state.weatherData.copyWith(
          isLoading: true,
        ),
      ),
    );

    final currentCity = await _cityDatabaseRepository.getCurrentCity();

    if (currentCity != null) {
      if (currentCity.lat == null && currentCity.lon == null) {
        emit(
          state.copyWith(
            weatherData: BaseState<WeatherDataModel>.fail(
              UnknownFailure(message: S.current.cityHasNotCoordinates),
            ),
          ),
        );
        return;
      }

      final response = await _remoteRepository.getWeatherDataByCityCoord(
        lat: currentCity.lat!,
        lon: currentCity.lon!,
      );

      response.fold((failure) {
        emit(
          state.copyWith(
            weatherData: BaseState<WeatherDataModel>.fail(failure),
          ),
        );
      }, (weatherData) {
        emit(
          state.copyWith(
            weatherData: BaseState<WeatherDataModel>.loaded(weatherData),
          ),
        );
      });
    } else {
      emit(
        state.copyWith(
          weatherData: BaseState<WeatherDataModel>.fail(
            NoCurrentCityFailure(
              message: S.current.noCurrentCitySelectedYet,
            ),
          ),
        ),
      );
    }
  }
}
