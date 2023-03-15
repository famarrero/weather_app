import 'package:drift/drift.dart';
import 'package:weather_app/src/data/data_sources/local/database/drift_database.dart';
import 'package:weather_app/src/data/data_sources/local/database/entities/cities/cities.dart';

// Moor works by source gen. This file will all the generated code.
part 'city_dao.g.dart';

// Denote which tables this DAO can access
@DriftAccessor(tables: [Cities])
class CityDao extends DatabaseAccessor<AppDatabase> with _$CityDaoMixin {
  CityDao(this.db) : super(db);

  final AppDatabase db;

  Future<int> insertCity(
    Insertable<CitiesTableEntity> city,
  ) =>
      into(cities).insert(city, mode: InsertMode.insertOrReplace);

  Stream<List<CitiesTableEntity>> watchCities() {
    return select(cities).watch();
  }

  Future<List<CitiesTableEntity>> getCities() {
    return select(cities).get();
  }

  Future deleteCityById(int id) =>
      (delete(cities)..where((tbl) => tbl.id.equals(id))).go();

  Future deleteAllCities() => (delete(cities)).go();

  Future<int> setCityAsCurrentById(int id) async {
    //Get the current city
    final currentCity = await (select(cities)
          ..where(
            (tbl) => tbl.current.equals(true),
          ))
        .getSingleOrNull();

    if (currentCity != null) {
      //Set the current city to false
      await (update(cities)..where((tbl) => tbl.id.equals(currentCity.id)))
          .write(
        const CitiesCompanion(
          current: Value(false),
        ),
      );
    }

    //Set the new current city to true
    return (update(cities)..where((tbl) => tbl.id.equals(id))).write(
      const CitiesCompanion(
        current: Value(true),
      ),
    );
  }

  Stream<CitiesTableEntity?> watchCurrentCity() {
    return (select(cities)..where((tbl) => tbl.current.equals(true)))
        .watchSingleOrNull();
  }

  Future<CitiesTableEntity?> getCurrentCity() {
    return (select(cities)..where((tbl) => tbl.current.equals(true)))
        .getSingleOrNull();
  }
}
