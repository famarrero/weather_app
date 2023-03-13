import 'package:weather_app/src/data/data_sources/local/database/drift_database.dart';

abstract class CityDatabaseRepository {
  Future<int> insertCity(CitiesTableEntity city);

  Stream<List<CitiesTableEntity>> watchCities();

  Future<List<CitiesTableEntity>> getCities();

  Future deleteCityById(int id);

  Future deleteAllCities();
}
