part of 'cities_manage_cubit.dart';

class CitiesManageState extends Equatable {
  const CitiesManageState({
    required this.myCities,
    required this.deleteCityInDB,
  });

  factory CitiesManageState.initial() => CitiesManageState(
        myCities: BaseBuiltListStreamState<CityEntity>.initial(),
        deleteCityInDB: const BaseState<bool>.initial(),
      );

  final BaseBuiltListStreamState<CityEntity> myCities;
  final BaseState<bool> deleteCityInDB;

  CitiesManageState copyWith({
    BaseBuiltListStreamState<CityEntity>? myCities,
    BaseState<bool>? deleteCityInDB,
  }) {
    return CitiesManageState(
      myCities: myCities ?? this.myCities,
      deleteCityInDB: deleteCityInDB ?? this.deleteCityInDB,
    );
  }

  @override
  List<Object?> get props => [
        myCities,
        deleteCityInDB,
      ];
}
