import 'package:drift/drift.dart';
import 'package:weather_app/src/data/data_sources/local/database/drift_database.dart';
import 'package:weather_app/src/data/data_sources/local/database/entities/cities/cities.dart';

// Moor works by source gen. This file will all the generated code.
part 'city_dao.g.dart';

// Denote which tables this DAO can access
@DriftAccessor(tables: [Cities])
class CityDao extends DatabaseAccessor<AppDatabase> with _$CityDaoMixin {
  final AppDatabase db;

  CityDao(this.db) : super(db);

  Stream<List<CitiesTableEntity>> watchSelectedQuickAccess() {
    return select(cities)
        .watch()
        .map((rows) => rows.map((row) => row.id).toList());
  }

  Future<List<CitiesTableEntity>> getSelectedQuickAccess() {
    return select(cities).map((p0) => p0.id).get();
  }

  Future<int> insertQuickAccess(
    Insertable<CitiesTableEntity> quickAccessTableEntity,
  ) =>
      into(cities)
          .insert(quickAccessTableEntity, mode: InsertMode.insertOrReplace);

  Future deleteQuickAccess(int id) =>
      (delete(cities)..where((tbl) => tbl.id.equals(id))).go();

  Future deleteAllQuickAccess() => (delete(cities)).go();
}
