import 'package:flutter/material.dart';

class Character {
  final int id;
  final String name;
  final ChClass chClass;
  final int lvl;
  final Color? imageColor;
  final String? imagePath;
  final Color textColor;
  final CharacterBio bio;

  Character({
    required this.id,
    required this.name,
    required this.chClass,
    required this.lvl,
    this.imageColor,
    this.imagePath,
    required this.textColor,
    required this.bio,
  });

  Character.empty({
    this.id = 0,
    this.name = '',
    this.chClass = ChClass.class0,
    this.lvl = 0,
    this.textColor = Colors.black,
  })  : bio = CharacterBio.empty(),
        imageColor = null,
        imagePath = null;

  Character copyWith({
    int? id,
    String? name,
    ChClass? chClass,
    int? lvl,
    Color? imageColor,
    String? imagePath,
    Color? textColor,
    CharacterBio? bio,
  }) {
    return Character(
        id: id ?? this.id,
        name: name ?? this.name,
        chClass: chClass ?? this.chClass,
        lvl: lvl ?? this.lvl,
        imageColor: imageColor ?? this.imageColor,
        imagePath: imagePath ?? this.imagePath,
        textColor: textColor ?? this.textColor,
        bio: bio ?? this.bio);
  }

  @override
  String toString() {
    return 'id: $id\nName: $name\nClass: $chClass\nLvl: $lvl'
        '\nimageColor: $imageColor\nimagePath: $imagePath\ntextColor: $textColor\n'
        'BIO:\n'
        'alignment: ${bio.alignment}\ndeiterity: ${bio.deiterity}\nrace: ${bio.race}\nage: ${bio.age}\n'
        'gender: ${bio.gender}\nsize: ${bio.size}\nweight: ${bio.weight}\nheight: ${bio.height}\n'
        'hairColor: ${bio.hairColor}\neyeColor: ${bio.eyeColor}';
  }

  String shortString() {
    return 'id: $id Name: $name Class: $chClass Lvl: $lvl';
  }
}

class CharacterBio {
  ///The same as the character.id
  final int id;
  final CharAlignment alignment;
  final String deiterity;
  final Race race;
  final int age;
  final Gender gender;
  final Size size;
  final double weight;
  final double height;
  final Color hairColor;
  final Color eyeColor;

  CharacterBio(
      {required this.id,
      required this.alignment,
      required this.deiterity,
      required this.race,
      required this.age,
      required this.gender,
      required this.size,
      required this.weight,
      required this.height,
      required this.hairColor,
      required this.eyeColor});

  CharacterBio.empty(
      {this.id = 0,
      this.alignment = CharAlignment.nn,
      this.deiterity = '',
      this.race = Race.race0,
      this.age = 0,
      this.gender = Gender.male,
      this.size = Size.m,
      this.weight = 0.0,
      this.height = 0.0,
      this.hairColor = Colors.black,
      this.eyeColor = Colors.black});

  CharacterBio copyWith(
      {int? id,
      CharAlignment? alignment,
      String? deiterity,
      Race? race,
      int? age,
      Gender? gender,
      Size? size,
      double? weight,
      double? height,
      Color? hairColor,
      Color? eyeColor}) {
    return CharacterBio(
        id: id ?? this.id,
        alignment: alignment ?? this.alignment,
        deiterity: deiterity ?? this.deiterity,
        race: race ?? this.race,
        age: age ?? this.age,
        gender: gender ?? this.gender,
        size: size ?? this.size,
        weight: weight ?? this.weight,
        height: height ?? this.height,
        hairColor: hairColor ?? this.hairColor,
        eyeColor: eyeColor ?? this.eyeColor);
  }
}

enum CharAlignment {
  lg,
  ng,
  cg,
  ln,
  nn,
  cn,
  le,
  ne,
  ce;

  String get alignName => name;
}

enum Race {
  race0,
  race1,
  race2;

  String get raceName => name;
}

enum Gender {
  male,
  female;

  String get genderName => name;
}

enum Size {
  d,
  t,
  s,
  m,
  l,
  h,
  g,
  c;

  String get sizeName => name;
}

enum ChClass {
  class0,
  class1,
  class2;

  String get chClassName => name;
}
