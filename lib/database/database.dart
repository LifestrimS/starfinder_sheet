import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

@DriftDatabase(tables: [TableCharacter])
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
      // If you need web support, see https://drift.simonbinder.eu/platforms/web/
    );
  }

  Future<List<TableCharacterData>> get getAllCharacters =>
      select(tableCharacter).get();

  Future<List<TableCharacterData>> getCharacterById(int id) =>
      (select(tableCharacter)..where((a) => a.id.equals(id))).get();

  Future<int> addCharacter(TableCharacterCompanion item) =>
      into(tableCharacter).insert(item, mode: InsertMode.replace);

  Future<void> updateCharacter(TableCharacterData item) =>
      (update(tableCharacter)..where((t) => t.id.equals(item.id))).write(item);

  Future deleteCharacterById(int id) =>
      (delete(tableCharacter)..where((t) => t.id.equals(id))).go();

  Future deleteAllCharacters() => (delete(tableCharacter)).go();
}

class TableCharacter extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get charName => text()();
  TextColumn get charClass => text()();
  IntColumn get lvl => integer()();
  TextColumn get race => text()();
  TextColumn get alignment => text()();
  TextColumn get size => text()();
}
