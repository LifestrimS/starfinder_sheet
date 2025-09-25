import 'package:elementary/elementary.dart';
import 'package:pathfinder_sheet/characrer_creation/widgets/ability_block.dart';
import 'package:pathfinder_sheet/repository/db_repository.dart';

class CharacterCreationModel extends ElementaryModel {
  final Repository _repository;

  CharacterCreationModel(this._repository);

  Ability getAbility() {
    return const Ability(
        str: 12, dex: 22, con: 16, intel: 12, wis: 14, cha: 17);
  }
}
