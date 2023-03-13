import 'package:drift/drift.dart';

@DataClassName('CitiesTableEntity')
class Cities extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().nullable()();

  TextColumn get lat => text().nullable()();

  TextColumn get lon => text().nullable()();

  TextColumn get country => text().nullable()();

  TextColumn get state => text().nullable()();
}
