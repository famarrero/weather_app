import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/src/core/failure/failures.dart';
import 'package:weather_app/src/core/utils/base_state.dart';
import 'package:weather_app/src/data/models/city/city_model.dart';
import 'package:weather_app/src/domain/entities/city/city_entity.dart';
import 'package:weather_app/src/domain/repositories/city_database_repository.dart';
import 'package:weather_app/src/domain/repositories/remote_repository.dart';

part 'search_city_state.dart';

class SearchCityCubit extends Cubit<SearchCityState> {
  SearchCityCubit(
    this._remoteRepository,
    this._cityDatabaseRepository,
  ) : super(SearchCityState.initial());

  final RemoteRepository _remoteRepository;
  final CityDatabaseRepository _cityDatabaseRepository;

  Future<void> getFoundCities(String query) async {
    emit(
      state.copyWith(
        foundCities: state.foundCities.copyWith(
          isLoading: true,
        ),
      ),
    );

    final response = await _remoteRepository.searchCity(city: query);

    response.fold((failure) {
      emit(
        state.copyWith(
          foundCities: BaseBuiltListState<CityModel>.fail(failure),
        ),
      );
    }, (cities) {
      emit(
        state.copyWith(
          foundCities: BaseBuiltListState<CityModel>.loaded(cities),
        ),
      );
    });
  }

  Future<void> insertCityInDB(CityModel cityModel) async {
    emit(
      state.copyWith(
        insertCityInDB: state.insertCityInDB.copyWith(
          isLoading: true,
        ),
      ),
    );
    try {
      await _cityDatabaseRepository
          .insertCity(_mapCityModelIntoCityEntity(cityModel));

      emit(
        state.copyWith(
          insertCityInDB: const BaseState<bool>.loaded(true),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          insertCityInDB: const BaseState<bool>.fail(
            UnknownFailure(
              message: 'Error al guardar la ciudad en la base de datos',
            ),
          ),
        ),
      );
    }
  }

  //Mapping the model that come from api into the entity that DB use
  CityEntity _mapCityModelIntoCityEntity(CityModel cityModel) {
    return CityEntity(
      (b) => b
        ..name = cityModel.name
        ..state = cityModel.state
        ..country = cityModel.country
        ..lat = cityModel.lat
        ..lon = cityModel.lon,
    );
  }
}
