import 'package:elementary/elementary.dart';
import 'package:pathfinder_sheet/characrer/widgets/ability_block.dart';
import 'package:pathfinder_sheet/repository/db_repository.dart';

class CharacterModel extends ElementaryModel {
  // ignore: unused_field
  final Repository _repository;

  CharacterModel(this._repository);

  Ability getAbility() {
    return const Ability(
        str: 12, dex: 22, con: 16, intel: 12, wis: 14, cha: 17);
  }
}
