import 'package:drift/drift.dart';
import 'package:pathfinder_sheet/database/database.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';

class Mapper {
  Character toCharacter(TableCharacterData element) {
    final CharacterAbility ability = CharacterAbility(
        strength: element.strength,
        dexterity: element.dexterity,
        constitution: element.constitution,
        intelligence: element.intelligence,
        wisdom: element.wisdom,
        charisma: element.charisma);

    final CharacterLiveBlock liveBlock = CharacterLiveBlock(
        maxHp: element.maxHp,
        currentHp: element.currentHp,
        maxStam: element.maxStam,
        currentStam: element.currentStam,
        maxResolve: element.maxResolve,
        currentResolve: element.currentResolve,
        damageLog: element.damageLog);

    final ACBLock eacBlock = ACBLock(
        amror: element.eacArmor,
        dodge: element.eacDodger,
        natural: element.eacNatural,
        deflect: element.eacDeflect,
        misc: element.eacMisc);

    final ACBLock kacBlock = ACBLock(
        amror: element.kacArmor,
        dodge: element.kacDodger,
        natural: element.kacNatural,
        deflect: element.kacDeflect,
        misc: element.kacMisc);

    return Character(
        id: element.id,
        charName: element.charName,
        charClass: element.charClass,
        lvl: element.lvl,
        race: element.race,
        alignment: CharAlignment.values
            .firstWhere((e) => e.alignName == element.alignment),
        size: CharSize.values.firstWhere((e) => e.sizeName == element.size),
        ability: ability,
        liveBlock: liveBlock,
        eacBlock: eacBlock,
        kacBlock: kacBlock,
        moveSpeed: element.moveSpeed,
        flySpeed: element.flySpeed,
        swimSpeed: element.swimSpeed);
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
        strength: character.ability.strength,
        dexterity: character.ability.dexterity,
        constitution: character.ability.constitution,
        intelligence: character.ability.intelligence,
        wisdom: character.ability.wisdom,
        charisma: character.ability.charisma,
        maxHp: character.liveBlock.maxHp,
        currentHp: character.liveBlock.currentHp,
        maxStam: character.liveBlock.maxStam,
        currentStam: character.liveBlock.currentStam,
        maxResolve: character.liveBlock.maxResolve,
        currentResolve: character.liveBlock.currentResolve,
        damageLog: character.liveBlock.damageLog,
        eacArmor: character.eacBlock.amror,
        eacDodger: character.eacBlock.dodge,
        eacNatural: character.eacBlock.natural,
        eacDeflect: character.eacBlock.deflect,
        eacMisc: character.eacBlock.misc,
        kacArmor: character.kacBlock.amror,
        kacDodger: character.kacBlock.dodge,
        kacNatural: character.kacBlock.natural,
        kacDeflect: character.kacBlock.deflect,
        kacMisc: character.kacBlock.misc,
        moveSpeed: character.moveSpeed,
        flySpeed: character.flySpeed,
        swimSpeed: character.swimSpeed);
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
        strength: Value(character.ability.strength),
        dexterity: Value(character.ability.dexterity),
        constitution: Value(character.ability.constitution),
        intelligence: Value(character.ability.intelligence),
        wisdom: Value(character.ability.wisdom),
        charisma: Value(character.ability.charisma),
        maxHp: Value(character.liveBlock.maxHp),
        currentHp: Value(character.liveBlock.currentHp),
        maxStam: Value(character.liveBlock.maxStam),
        currentStam: Value(character.liveBlock.currentStam),
        maxResolve: Value(character.liveBlock.maxResolve),
        currentResolve: Value(character.liveBlock.currentResolve),
        damageLog: Value(character.liveBlock.damageLog),
        eacArmor: Value(character.eacBlock.amror),
        eacDodger: Value(character.eacBlock.dodge),
        eacNatural: Value(character.eacBlock.natural),
        eacDeflect: Value(character.eacBlock.deflect),
        eacMisc: Value(character.eacBlock.misc),
        kacArmor: Value(character.kacBlock.amror),
        kacDodger: Value(character.kacBlock.dodge),
        kacNatural: Value(character.kacBlock.natural),
        kacDeflect: Value(character.kacBlock.deflect),
        kacMisc: Value(character.kacBlock.misc),
        moveSpeed: Value(character.moveSpeed),
        flySpeed: Value(character.flySpeed),
        swimSpeed: Value(character.swimSpeed));
  }
}
