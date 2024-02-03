import 'package:drift/drift.dart';
import 'package:pathfinder_sheet/character_list/character_list_model.dart';
import 'package:pathfinder_sheet/database/database.dart';

class Mapper {
  Character toCharacter(TableCharacterData element) {
    return Character(
        id: element.id, name: element.chName, chClass: element.chClass);
  }

  TableCharacterData toTableCharacterData(Character character) {
    return TableCharacterData(
        id: character.id, chName: character.name, chClass: character.chClass);
  }

  TableCharacterCompanion toTableCharacterCompanion(Character character) {
    return TableCharacterCompanion(
        chName: Value(character.name), chClass: Value(character.chClass));
  }
}
