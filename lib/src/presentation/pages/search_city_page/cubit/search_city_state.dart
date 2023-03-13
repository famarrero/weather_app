part of 'search_city_cubit.dart';

class SearchCityState extends Equatable {
  const SearchCityState({
    required this.foundCities,
    required this.insertCityInDB,
    required this.message,
  });

  factory SearchCityState.initial() => SearchCityState(
        foundCities: BaseBuiltListState<CityModel>.initial(),
        insertCityInDB: const BaseState<bool>.initial(),
        message: null,
      );

  final BaseBuiltListState<CityModel> foundCities;
  final BaseState<bool> insertCityInDB;
  final String? message;

  SearchCityState copyWith({
    BaseBuiltListState<CityModel>? foundCities,
    BaseState<bool>? insertCityInDB,
    String? message,
  }) {
    return SearchCityState(
      foundCities: foundCities ?? this.foundCities,
      insertCityInDB: insertCityInDB ?? this.insertCityInDB,
      message: message,
    );
  }

  @override
  List<Object?> get props => [foundCities, insertCityInDB, message];
}
