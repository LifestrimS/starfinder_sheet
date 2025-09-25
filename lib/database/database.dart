import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
// ignore: depend_on_referenced_packages
import 'package:sqlite3/sqlite3.dart';
// ignore: depend_on_referenced_packages
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'database.g.dart';

@DriftDatabase(tables: [TableCharacter])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

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

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    final cachebase = (await getTemporaryDirectory()).path;
    // We can't access /tmp on Android, which sqlite3 would try by default.
    // Explicitly tell it about the correct temporary directory.
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}

class TableCharacter extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get chName => text().named('chName')();
  IntColumn get chClass => integer().named('chClass')();
  IntColumn get lvl => integer().named('lvl')();
  TextColumn get imageColor => text().named('imageColor')();
  TextColumn get imagePath => text().named('imagePath')();
  TextColumn get textColor => text().named('textColor')();
  IntColumn get alignment => integer().named('')();
  TextColumn get deiterity => text().named('deiterity')();
  IntColumn get race => integer().named('race')();
  IntColumn get age => integer().named('age')();
  IntColumn get gender => integer().named('gender')();
  IntColumn get size => integer().named('size')();
  RealColumn get weight => real().named('weight')();
  RealColumn get height => real().named('height')();
  TextColumn get hairColor => text().named('hairColor')();
  TextColumn get eyeColor => text().named('eyeColor')();
}
