import 'package:pathfinder_sheet/database/database.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';
import 'package:pathfinder_sheet/repository/mapper.dart';

class Repository {
  final AppDb _db;

  Repository(this._db);

  Future<Character> getCharacterById(int id) async {
    List<TableCharacterData> character = await _db.getCharacterById(id);
    return Mapper().toCharacter(character[0]);
  }

  Future<List<Character>> getAllCharacter() async {
    List<TableCharacterData> dbList = await _db.getAllCharacters;
    List<Character> characters = [];
    for (var element in dbList) {
      characters.add(Mapper().toCharacter(element));
    }
    return characters;
  }

  Future<int> addCharacter(Character character) async {
    return await _db
        .addCharacter(Mapper().toTableCharacterCompanion(character));
  }

  Future<void> updateCharacter(Character item) async {
    return await _db.updateCharacter(Mapper().toTableCharacterData(item));
  }

  Future<void> deleteCharacterbyId(int id) async {
    return await _db.deleteCharacterById(id);
  }

  Future<void> deleteAllCharacters() async {
    return await _db.deleteAllCharacters();
  }
}
