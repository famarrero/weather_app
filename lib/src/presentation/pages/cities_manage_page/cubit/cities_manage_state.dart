part of 'cities_manage_cubit.dart';

class CitiesManageState extends Equatable {
  const CitiesManageState({
    required this.myCities,
    required this.deleteCityInDB,
    required this.setCityAsCurrent,
  });

  factory CitiesManageState.initial() => CitiesManageState(
        myCities: BaseBuiltListStreamState<CityEntity>.initial(),
        deleteCityInDB: const BaseState<bool>.initial(),
        setCityAsCurrent: const BaseState<bool>.initial(),
      );

  final BaseBuiltListStreamState<CityEntity> myCities;
  final BaseState<bool> deleteCityInDB;
  final BaseState<bool> setCityAsCurrent;

  CitiesManageState copyWith({
    BaseBuiltListStreamState<CityEntity>? myCities,
    BaseState<bool>? deleteCityInDB,
    BaseState<bool>? setCityAsCurrent,
  }) {
    return CitiesManageState(
      myCities: myCities ?? this.myCities,
      deleteCityInDB: deleteCityInDB ?? this.deleteCityInDB,
      setCityAsCurrent: setCityAsCurrent ?? this.setCityAsCurrent,
    );
  }

  @override
  List<Object?> get props => [
        myCities,
        deleteCityInDB,
        setCityAsCurrent,
      ];
}
