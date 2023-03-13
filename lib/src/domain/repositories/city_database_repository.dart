import 'package:weather_app/src/domain/entities/city/city_entity.dart';

abstract class CityDatabaseRepository {
  Future<int> insertCity(CityEntity city);

  Stream<List<CityEntity>> watchCities();

  Future<List<CityEntity>> getCities();

  Future deleteCityById(int id);

  Future deleteAllCities();
}
