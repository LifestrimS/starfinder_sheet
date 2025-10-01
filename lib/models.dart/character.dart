class Character {
  final int id;
  final String charName;
  final String charClass;
  final int lvl;
  final String race;
  final String alignment;
  final String size;

  Character(
      {required this.id,
      required this.charName,
      required this.charClass,
      required this.lvl,
      required this.race,
      required this.alignment,
      required this.size});

  Character.empty(
      {this.id = 0,
      this.charName = 'Name',
      this.charClass = 'Class',
      this.lvl = 0,
      this.race = 'Race',
      this.alignment = 'NN',
      this.size = 'M'});

  Character copyWith(
      {int? id,
      String? charName,
      String? charClass,
      int? lvl,
      String? race,
      String? alignment,
      String? size}) {
    return Character(
        id: id ?? this.id,
        charName: charName ?? this.charName,
        charClass: charClass ?? this.charClass,
        lvl: lvl ?? this.lvl,
        race: race ?? this.race,
        alignment: alignment ?? this.alignment,
        size: size ?? this.size);
  }

  @override
  String toString() {
    return 'id: $id\nName: $charName\nClass: $charClass\nLvl: $lvl'
        '\nRace: $race\nAlignment: $alignment\nSize: $size';
  }

  String shortString() {
    return 'id: $id Name: $charName Class: $charClass Lvl: $lvl';
  }
}

// enum CharAlignment {
//   lg,
//   ng,
//   cg,
//   ln,
//   nn,
//   cn,
//   le,
//   ne,
//   ce;

//   String get alignName => name;
// }

// enum Size {
//   d,
//   t,
//   s,
//   m,
//   l,
//   h,
//   g,
//   c;

//   String get sizeName => name;
// }
