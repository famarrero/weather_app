import 'package:drift/drift.dart';
import 'package:weather_app/src/data/data_sources/local/database/daos/city/city_dao.dart';
import 'package:weather_app/src/data/data_sources/local/database/drift_database.dart';
import 'package:weather_app/src/domain/entities/city/city_entity.dart';
import 'package:weather_app/src/domain/repositories/city_database_repository.dart';

class CityDatabaseRepositoryImpl implements CityDatabaseRepository {
  const CityDatabaseRepositoryImpl(this._cityDao);

  final CityDao _cityDao;

  @override
  Future<int> insertCity(CityEntity city) {
    final CitiesCompanion citiesCompanion = CitiesCompanion(
      name: Value(city.name),
      state: Value(city.state),
      country: Value(city.country),
      lat: Value(city.lat),
      lon: Value(city.lon),
      current: Value(city.current),
    );

    return _cityDao.insertCity(citiesCompanion);
  }

  @override
  Stream<List<CityEntity>> watchCities() {
    final watchCitiesStream = _cityDao.watchCities();

    final Stream<List<CityEntity>> mappedStream =
        watchCitiesStream.map<List<CityEntity>>(
      (cities) => cities
          .map<CityEntity>((city) => _mapDBEntityIntoCityEntity(city))
          .toList(),
    );

    return mappedStream;
  }

  @override
  Future<List<CityEntity>> getCities() async {
    final getCitiesFuture = await _cityDao.getCities();

    final List<CityEntity> mappedFuture = getCitiesFuture
        .map((city) => _mapDBEntityIntoCityEntity(city))
        .toList();

    return mappedFuture;
  }

  @override
  Future deleteCityById(int id) {
    return _cityDao.deleteCityById(id);
  }

  @override
  Future deleteAllCities() {
    return _cityDao.deleteAllCities();
  }

  @override
  Future setCityAsCurrentById(int id) {
    return _cityDao.setCityAsCurrentById(id);
  }

  @override
  Stream<CityEntity?> watchCurrentCity() {
    final watchCityStream = _cityDao.watchCurrentCity();

    final Stream<CityEntity?> mappedStream =
        watchCityStream.map<CityEntity?>((city) {
      if (city != null) {
        return _mapDBEntityIntoCityEntity(city);
      } else {
        return null;
      }
    });

    return mappedStream;
  }

  @override
  Future<CityEntity?> getCurrentCity() async {
    final getCityFuture = await _cityDao.getCurrentCity();

    if (getCityFuture != null) {
      return _mapDBEntityIntoCityEntity(getCityFuture);
    } else {
      return null;
    }
  }

  CityEntity _mapDBEntityIntoCityEntity(CitiesTableEntity dbEntity) {
    return CityEntity(
      (b) => b
        ..id = dbEntity.id
        ..name = dbEntity.name
        ..state = dbEntity.state
        ..country = dbEntity.country
        ..lat = dbEntity.lat
        ..lon = dbEntity.lon
        ..current = dbEntity.current,
    );
  }
}
