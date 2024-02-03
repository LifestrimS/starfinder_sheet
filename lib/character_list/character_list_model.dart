import 'package:elementary/elementary.dart';

class CharacterListModel extends ElementaryModel {}

class Character {
  final String name;
  final String chClass;

  Character({
    required this.name,
    required this.chClass,
  });
}
