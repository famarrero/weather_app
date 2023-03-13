part of 'search_city_cubit.dart';

class SearchCityState extends Equatable {
  const SearchCityState({
    required this.foundCities,
  });

  factory SearchCityState.initial() => SearchCityState(
        foundCities: BaseBuiltListState<CityModel>.initial(),
      );

  final BaseBuiltListState<CityModel> foundCities;

  SearchCityState copyWith({BaseBuiltListState<CityModel>? foundCities}) {
    return SearchCityState(
      foundCities: foundCities ?? this.foundCities,
    );
  }

  @override
  List<Object?> get props => [foundCities];
}
