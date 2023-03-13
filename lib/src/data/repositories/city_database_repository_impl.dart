import 'package:weather_app/src/data/data_sources/local/database/daos/city/city_dao.dart';
import 'package:weather_app/src/data/data_sources/local/database/drift_database.dart';
import 'package:weather_app/src/domain/repositories/city_database_repository.dart';

class CityDatabaseRepositoryImpl implements CityDatabaseRepository {
  const CityDatabaseRepositoryImpl(this._cityDao);

  final CityDao _cityDao;

  @override
  Future<int> insertCity(CitiesTableEntity city) {
    return _cityDao.insertCity(city);
  }

  @override
  Stream<List<CitiesTableEntity>> watchCities() {
    return _cityDao.watchCities();
  }

  @override
  Future<List<CitiesTableEntity>> getCities() {
    return _cityDao.getCities();
  }

  @override
  Future deleteCityById(int id) {
    return _cityDao.deleteCityById(id);
  }

  @override
  Future deleteAllCities() {
    return _cityDao.deleteAllCities();
  }
}
