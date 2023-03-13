import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/src/core/failure/failures.dart';
import 'package:weather_app/src/core/utils/base_state.dart';
import 'package:weather_app/src/domain/entities/city/city_entity.dart';
import 'package:weather_app/src/domain/repositories/city_database_repository.dart';

part 'cities_manage_state.dart';

class CitiesManageCubit extends Cubit<CitiesManageState> {
  CitiesManageCubit(
    this._cityDatabaseRepository,
  ) : super(CitiesManageState.initial()) {
    watchMyCities();
  }

  final CityDatabaseRepository _cityDatabaseRepository;

  Future<void> watchMyCities() async {
    final Stream<List<CityEntity>> myCitiesStream =
        _cityDatabaseRepository.watchCities();

    emit(
      state.copyWith(
        myCities: BaseBuiltListStreamState<CityEntity>.loaded(
          myCitiesStream,
        ),
      ),
    );
  }

  Future<void> deleteCityInDB(CityEntity city) async {
    if (city.id == null) return;
    emit(
      state.copyWith(
        deleteCityInDB: state.deleteCityInDB.copyWith(
          isLoading: true,
        ),
      ),
    );
    try {
      await _cityDatabaseRepository.deleteCityById(city.id!);

      emit(
        state.copyWith(
          deleteCityInDB: const BaseState<bool>.loaded(true),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          deleteCityInDB: const BaseState<bool>.fail(
            UnknownFailure(
              message: 'Error al eliminar la ciudad en la base de datos',
            ),
          ),
        ),
      );
    }
  }
}
