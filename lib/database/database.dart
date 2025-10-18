import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';

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

  //ability
  IntColumn get strength => integer()();
  IntColumn get strengthTmp => integer()();
  IntColumn get dexterity => integer()();
  IntColumn get dexterityTmp => integer()();
  IntColumn get constitution => integer()();
  IntColumn get constitutionTmp => integer()();
  IntColumn get intelligence => integer()();
  IntColumn get intelligenceTmp => integer()();
  IntColumn get wisdom => integer()();
  IntColumn get wisdomTmp => integer()();
  IntColumn get charisma => integer()();
  IntColumn get charismaTmp => integer()();

  //liveBlock
  IntColumn get maxHp => integer()();
  IntColumn get currentHp => integer()();
  IntColumn get maxStam => integer()();
  IntColumn get currentStam => integer()();
  IntColumn get maxResolve => integer()();
  IntColumn get currentResolve => integer()();
  TextColumn get damageLog => text()();

  //acBlock
  IntColumn get eacArmor => integer()();
  IntColumn get eacDodger => integer()();
  IntColumn get eacNatural => integer()();
  IntColumn get eacDeflect => integer()();
  IntColumn get eacMisc => integer()();
  IntColumn get kacArmor => integer()();
  IntColumn get kacDodger => integer()();
  IntColumn get kacNatural => integer()();
  IntColumn get kacDeflect => integer()();
  IntColumn get kacMisc => integer()();

  //Move
  IntColumn get moveSpeed => integer()();
  IntColumn get flySpeed => integer()();
  IntColumn get swimSpeed => integer()();

  //Init
  IntColumn get initMisc => integer()();

  //Bab
  IntColumn get bab => integer()();
  IntColumn get mabMisc => integer()();
  IntColumn get mabTemp => integer()();
  IntColumn get tabMisc => integer()();
  IntColumn get tabTemp => integer()();
  IntColumn get rabMisc => integer()();
  IntColumn get rabTemp => integer()();

  //SavingThrows
  IntColumn get fortBase => integer()();
  IntColumn get fortMagic => integer()();
  IntColumn get fortMisc => integer()();
  IntColumn get fortTemp => integer()();
  IntColumn get refBase => integer()();
  IntColumn get refMagic => integer()();
  IntColumn get refMisc => integer()();
  IntColumn get refTemp => integer()();
  IntColumn get willBase => integer()();
  IntColumn get willMagic => integer()();
  IntColumn get willMisc => integer()();
  IntColumn get willTemp => integer()();

  //DRs SRs
  TextColumn get dr => text()();
  TextColumn get sr => text()();

  BoolColumn get isMagic => boolean()();

  TextColumn get weapons => text().map(WeaponList.converter).nullable()();

  TextColumn get armors => text().map(ArmorList.converter).nullable()();

  TextColumn get skills => text().map(SkillList.converter).nullable()();
}
