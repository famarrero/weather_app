import 'package:drift/drift.dart';

@DataClassName('CitiesTableEntity')
class Cities extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().nullable()();

  RealColumn get lat => real().nullable()();

  RealColumn get lon => real().nullable()();

  TextColumn get country => text().nullable()();

  TextColumn get state => text().nullable()();
}
