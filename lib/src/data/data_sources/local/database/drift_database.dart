import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:weather_app/src/data/data_sources/local/database/daos/city/city_dao.dart';
import 'package:weather_app/src/data/data_sources/local/database/entities/cities/cities.dart';

part 'drift_database.g.dart';

@DriftDatabase(
  tables: [
    Cities,
  ],
  daos: [
    CityDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
