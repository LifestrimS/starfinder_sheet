import 'package:drift/drift.dart';
import 'package:pathfinder_sheet/database/database.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';
import 'package:pathfinder_sheet/utils/utils.dart';

class Mapper {
  Character toCharacter(TableCharacterData element) {
    final CharacterBio tmpBio = CharacterBio(
        id: element.id,
        alignment: CharAlignment.values[element.alignment],
        deiterity: element.deiterity,
        race: Race.values[element.race],
        age: element.age,
        gender: Gender.values[element.gender],
        size: Size.values[element.size],
        weight: element.weight,
        height: element.height,
        hairColor: getColorFromString(element.hairColor),
        eyeColor: getColorFromString(element.eyeColor));
    return Character(
        id: element.id,
        name: element.chName,
        chClass: ChClass.values[element.chClass],
        lvl: element.lvl,
        textColor: getColorFromString(element.textColor),
        bio: tmpBio);
  }

  TableCharacterData toTableCharacterData(Character character) {
    return TableCharacterData(
      id: character.id,
      chName: character.name,
      chClass: character.chClass.index,
      age: character.bio.age,
      alignment: character.bio.alignment.index,
      deiterity: character.bio.deiterity,
      eyeColor: character.bio.eyeColor.toString(),
      gender: character.bio.gender.index,
      hairColor: character.bio.hairColor.toString(),
      height: character.bio.height,
      imageColor: character.imageColor.toString(),
      imagePath: character.imagePath.toString(),
      lvl: character.lvl,
      race: character.bio.race.index,
      size: character.bio.size.index,
      textColor: character.textColor.toString(),
      weight: character.bio.weight,
    );
  }

  TableCharacterCompanion toTableCharacterCompanion(Character character) {
    return TableCharacterCompanion(
        //id: Value(character.id),
        chName: Value(character.name),
        chClass: Value(character.chClass.index),
        age: Value(character.bio.age),
        alignment: Value(character.bio.alignment.index),
        deiterity: Value(character.bio.deiterity),
        eyeColor: Value(character.bio.eyeColor.toString()),
        gender: Value(character.bio.gender.index),
        hairColor: Value(character.bio.hairColor.toString()),
        height: Value(character.bio.height),
        imageColor: Value(character.imageColor.toString()),
        imagePath: Value(character.imagePath.toString()),
        lvl: Value(character.lvl),
        race: Value(character.bio.race.index),
        size: Value(character.bio.size.index),
        textColor: Value(character.textColor.toString()),
        weight: Value(
          character.bio.weight,
        ));
  }
}
