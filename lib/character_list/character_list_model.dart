import 'package:elementary/elementary.dart';

class CharacterListModel extends ElementaryModel {}

class Character {
  final int id;
  final String name;
  final String chClass;

  Character({
    required this.id,
    required this.name,
    required this.chClass,
  });

  @override
  String toString() {
    return 'id: $id Name: $name Class: $chClass';
  }
}
