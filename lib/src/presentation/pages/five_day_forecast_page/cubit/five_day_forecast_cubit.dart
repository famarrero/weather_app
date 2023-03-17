import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/src/core/utils/base_state.dart';
import 'package:weather_app/src/data/models/weather_data/weather_data_model.dart';
import 'package:weather_app/src/domain/repositories/remote_repository.dart';

part 'five_day_forecast_state.dart';

class FiveDayForecastCubit extends Cubit<FiveDayForecastState> {
  FiveDayForecastCubit(
    this._remoteRepository,
    this.lat,
    this.lon,
  ) : super(FiveDayForecastState.initial()) {
    getFiveDayForecastByCityCoord();
  }

  final RemoteRepository _remoteRepository;
  final double lat;
  final double lon;

  Future<void> sortWeathersDataByTemp() async {
    final List<WeatherDataModel> list = state.weathersData.listData.toList();

    if (state.orderAsc == true) {
      list.sort((a, b) {
        if (a.main?.temp != null && b.main?.temp != null) {
          return b.main!.temp!.compareTo(a.main!.temp!);
        } else {
          return 0;
        }
      });

      emit(
        state.copyWith(
          orderAsc: false,
          weathersData:
              BaseBuiltListState<WeatherDataModel>.loaded(list.toBuiltList()),
        ),
      );
    } else {
      list.sort((a, b) {
        if (a.main?.temp != null && b.main?.temp != null) {
          return a.main!.temp!.compareTo(b.main!.temp!);
        } else {
          return 0;
        }
      });

      emit(
        state.copyWith(
          orderAsc: true,
          weathersData:
              BaseBuiltListState<WeatherDataModel>.loaded(list.toBuiltList()),
        ),
      );
    }
  }

  Future<void> getFiveDayForecastByCityCoord() async {
    emit(
      state.copyWith(
        weathersData: state.weathersData.copyWith(
          isLoading: true,
        ),
      ),
    );

    final response = await _remoteRepository.getFiveDayForeCastByCityCoord(
      lat: lat,
      lon: lon,
    );

    response.fold((failure) {
      emit(
        state.copyWith(
          weathersData: BaseBuiltListState<WeatherDataModel>.fail(failure),
        ),
      );
    }, (weathersData) {
      emit(
        state.copyWith(
          weathersData:
              BaseBuiltListState<WeatherDataModel>.loaded(weathersData),
        ),
      );
    });
  }
}
