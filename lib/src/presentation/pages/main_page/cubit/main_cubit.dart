import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/src/core/utils/base_state.dart';
import 'package:weather_app/src/data/models/weather_data/weather_data_model.dart';
import 'package:weather_app/src/domain/entities/city/city_entity.dart';
import 'package:weather_app/src/domain/repositories/remote_repository.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit(this._remoteRepository) : super(MainState.initial()) {


    // getWeatherDataByCityCoord();
  }

  final RemoteRepository _remoteRepository;
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

  Future<void> getWeatherDataByCityCoord(CityEntity city) async {
    if (city.lat == null && city.lon == null) return;

    emit(
      state.copyWith(
        weatherData: state.weatherData.copyWith(
          isLoading: true,
        ),
      ),
    );

    final response = await _remoteRepository.getWeatherDataByCityCoord(
      lat: city.lat!,
      lon: city.lon!,
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
  }
}
