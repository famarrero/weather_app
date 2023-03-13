import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/src/core/utils/base_state.dart';
import 'package:weather_app/src/data/models/city/city_model.dart';
import 'package:weather_app/src/domain/repositories/remote_repository.dart';

part 'search_city_state.dart';

class SearchCityCubit extends Cubit<SearchCityState> {
  SearchCityCubit(
    this._remoteRepository,
  ) : super(SearchCityState.initial());

  final RemoteRepository _remoteRepository;

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
}
