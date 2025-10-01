import 'package:drift/drift.dart';
import 'package:pathfinder_sheet/database/database.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';

class TableCharacter extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get charName => text()();
  TextColumn get charClass => text()();
  IntColumn get lvl => integer()();
  TextColumn get race => text()();
  TextColumn get alignment => text()();
  TextColumn get size => text()();
}

class Mapper {
  Character toCharacter(TableCharacterData element) {
    return Character(
        id: element.id,
        charName: element.charName,
        charClass: element.charClass,
        lvl: element.lvl,
        race: element.race,
        alignment: CharAlignment.values
            .firstWhere((e) => e.alignName == element.alignment),
        size: CharSize.values.firstWhere((e) => e.sizeName == element.size));
  }

  TableCharacterData toTableCharacterData(Character character) {
    return TableCharacterData(
      id: character.id,
      charName: character.charName,
      charClass: character.charClass,
      lvl: character.lvl,
      race: character.race,
      alignment: character.alignment.alignName,
      size: character.size.sizeName,
    );
  }

  TableCharacterCompanion toTableCharacterCompanion(Character character) {
    return TableCharacterCompanion(
      //id: Value(character.id),
      charName: Value(character.charName),
      charClass: Value(character.charClass),
      lvl: Value(character.lvl),
      race: Value(character.race),
      alignment: Value(character.alignment.alignName),
      size: Value(character.size.sizeName),
    );
  }
}
