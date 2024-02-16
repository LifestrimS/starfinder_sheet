// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TableCharacterTable extends TableCharacter
    with TableInfo<$TableCharacterTable, TableCharacterData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TableCharacterTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _chNameMeta = const VerificationMeta('chName');
  @override
  late final GeneratedColumn<String> chName = GeneratedColumn<String>(
      'chName', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _chClassMeta =
      const VerificationMeta('chClass');
  @override
  late final GeneratedColumn<int> chClass = GeneratedColumn<int>(
      'chClass', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lvlMeta = const VerificationMeta('lvl');
  @override
  late final GeneratedColumn<int> lvl = GeneratedColumn<int>(
      'lvl', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _imageColorMeta =
      const VerificationMeta('imageColor');
  @override
  late final GeneratedColumn<String> imageColor = GeneratedColumn<String>(
      'imageColor', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imagePathMeta =
      const VerificationMeta('imagePath');
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
      'imagePath', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _textColorMeta =
      const VerificationMeta('textColor');
  @override
  late final GeneratedColumn<String> textColor = GeneratedColumn<String>(
      'textColor', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _alignmentMeta =
      const VerificationMeta('alignment');
  @override
  late final GeneratedColumn<int> alignment = GeneratedColumn<int>(
      '', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _deiterityMeta =
      const VerificationMeta('deiterity');
  @override
  late final GeneratedColumn<String> deiterity = GeneratedColumn<String>(
      'deiterity', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _raceMeta = const VerificationMeta('race');
  @override
  late final GeneratedColumn<int> race = GeneratedColumn<int>(
      'race', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
      'age', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<int> gender = GeneratedColumn<int>(
      'gender', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sizeMeta = const VerificationMeta('size');
  @override
  late final GeneratedColumn<int> size = GeneratedColumn<int>(
      'size', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
      'weight', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<double> height = GeneratedColumn<double>(
      'height', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _hairColorMeta =
      const VerificationMeta('hairColor');
  @override
  late final GeneratedColumn<String> hairColor = GeneratedColumn<String>(
      'hairColor', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _eyeColorMeta =
      const VerificationMeta('eyeColor');
  @override
  late final GeneratedColumn<String> eyeColor = GeneratedColumn<String>(
      'eyeColor', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        chName,
        chClass,
        lvl,
        imageColor,
        imagePath,
        textColor,
        alignment,
        deiterity,
        race,
        age,
        gender,
        size,
        weight,
        height,
        hairColor,
        eyeColor
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'table_character';
  @override
  VerificationContext validateIntegrity(Insertable<TableCharacterData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('chName')) {
      context.handle(_chNameMeta,
          chName.isAcceptableOrUnknown(data['chName']!, _chNameMeta));
    } else if (isInserting) {
      context.missing(_chNameMeta);
    }
    if (data.containsKey('chClass')) {
      context.handle(_chClassMeta,
          chClass.isAcceptableOrUnknown(data['chClass']!, _chClassMeta));
    } else if (isInserting) {
      context.missing(_chClassMeta);
    }
    if (data.containsKey('lvl')) {
      context.handle(
          _lvlMeta, lvl.isAcceptableOrUnknown(data['lvl']!, _lvlMeta));
    } else if (isInserting) {
      context.missing(_lvlMeta);
    }
    if (data.containsKey('imageColor')) {
      context.handle(
          _imageColorMeta,
          imageColor.isAcceptableOrUnknown(
              data['imageColor']!, _imageColorMeta));
    } else if (isInserting) {
      context.missing(_imageColorMeta);
    }
    if (data.containsKey('imagePath')) {
      context.handle(_imagePathMeta,
          imagePath.isAcceptableOrUnknown(data['imagePath']!, _imagePathMeta));
    } else if (isInserting) {
      context.missing(_imagePathMeta);
    }
    if (data.containsKey('textColor')) {
      context.handle(_textColorMeta,
          textColor.isAcceptableOrUnknown(data['textColor']!, _textColorMeta));
    } else if (isInserting) {
      context.missing(_textColorMeta);
    }
    if (data.containsKey('')) {
      context.handle(_alignmentMeta,
          alignment.isAcceptableOrUnknown(data['']!, _alignmentMeta));
    } else if (isInserting) {
      context.missing(_alignmentMeta);
    }
    if (data.containsKey('deiterity')) {
      context.handle(_deiterityMeta,
          deiterity.isAcceptableOrUnknown(data['deiterity']!, _deiterityMeta));
    } else if (isInserting) {
      context.missing(_deiterityMeta);
    }
    if (data.containsKey('race')) {
      context.handle(
          _raceMeta, race.isAcceptableOrUnknown(data['race']!, _raceMeta));
    } else if (isInserting) {
      context.missing(_raceMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('size')) {
      context.handle(
          _sizeMeta, size.isAcceptableOrUnknown(data['size']!, _sizeMeta));
    } else if (isInserting) {
      context.missing(_sizeMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('height')) {
      context.handle(_heightMeta,
          height.isAcceptableOrUnknown(data['height']!, _heightMeta));
    } else if (isInserting) {
      context.missing(_heightMeta);
    }
    if (data.containsKey('hairColor')) {
      context.handle(_hairColorMeta,
          hairColor.isAcceptableOrUnknown(data['hairColor']!, _hairColorMeta));
    } else if (isInserting) {
      context.missing(_hairColorMeta);
    }
    if (data.containsKey('eyeColor')) {
      context.handle(_eyeColorMeta,
          eyeColor.isAcceptableOrUnknown(data['eyeColor']!, _eyeColorMeta));
    } else if (isInserting) {
      context.missing(_eyeColorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TableCharacterData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TableCharacterData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      chName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}chName'])!,
      chClass: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}chClass'])!,
      lvl: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}lvl'])!,
      imageColor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}imageColor'])!,
      imagePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}imagePath'])!,
      textColor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}textColor'])!,
      alignment: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}'])!,
      deiterity: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}deiterity'])!,
      race: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}race'])!,
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}age'])!,
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}gender'])!,
      size: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}size'])!,
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight'])!,
      height: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}height'])!,
      hairColor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hairColor'])!,
      eyeColor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}eyeColor'])!,
    );
  }

  @override
  $TableCharacterTable createAlias(String alias) {
    return $TableCharacterTable(attachedDatabase, alias);
  }
}

class TableCharacterData extends DataClass
    implements Insertable<TableCharacterData> {
  final int id;
  final String chName;
  final int chClass;
  final int lvl;
  final String imageColor;
  final String imagePath;
  final String textColor;
  final int alignment;
  final String deiterity;
  final int race;
  final int age;
  final int gender;
  final int size;
  final double weight;
  final double height;
  final String hairColor;
  final String eyeColor;
  const TableCharacterData(
      {required this.id,
      required this.chName,
      required this.chClass,
      required this.lvl,
      required this.imageColor,
      required this.imagePath,
      required this.textColor,
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
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['chName'] = Variable<String>(chName);
    map['chClass'] = Variable<int>(chClass);
    map['lvl'] = Variable<int>(lvl);
    map['imageColor'] = Variable<String>(imageColor);
    map['imagePath'] = Variable<String>(imagePath);
    map['textColor'] = Variable<String>(textColor);
    map[''] = Variable<int>(alignment);
    map['deiterity'] = Variable<String>(deiterity);
    map['race'] = Variable<int>(race);
    map['age'] = Variable<int>(age);
    map['gender'] = Variable<int>(gender);
    map['size'] = Variable<int>(size);
    map['weight'] = Variable<double>(weight);
    map['height'] = Variable<double>(height);
    map['hairColor'] = Variable<String>(hairColor);
    map['eyeColor'] = Variable<String>(eyeColor);
    return map;
  }

  TableCharacterCompanion toCompanion(bool nullToAbsent) {
    return TableCharacterCompanion(
      id: Value(id),
      chName: Value(chName),
      chClass: Value(chClass),
      lvl: Value(lvl),
      imageColor: Value(imageColor),
      imagePath: Value(imagePath),
      textColor: Value(textColor),
      alignment: Value(alignment),
      deiterity: Value(deiterity),
      race: Value(race),
      age: Value(age),
      gender: Value(gender),
      size: Value(size),
      weight: Value(weight),
      height: Value(height),
      hairColor: Value(hairColor),
      eyeColor: Value(eyeColor),
    );
  }

  factory TableCharacterData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TableCharacterData(
      id: serializer.fromJson<int>(json['id']),
      chName: serializer.fromJson<String>(json['chName']),
      chClass: serializer.fromJson<int>(json['chClass']),
      lvl: serializer.fromJson<int>(json['lvl']),
      imageColor: serializer.fromJson<String>(json['imageColor']),
      imagePath: serializer.fromJson<String>(json['imagePath']),
      textColor: serializer.fromJson<String>(json['textColor']),
      alignment: serializer.fromJson<int>(json['alignment']),
      deiterity: serializer.fromJson<String>(json['deiterity']),
      race: serializer.fromJson<int>(json['race']),
      age: serializer.fromJson<int>(json['age']),
      gender: serializer.fromJson<int>(json['gender']),
      size: serializer.fromJson<int>(json['size']),
      weight: serializer.fromJson<double>(json['weight']),
      height: serializer.fromJson<double>(json['height']),
      hairColor: serializer.fromJson<String>(json['hairColor']),
      eyeColor: serializer.fromJson<String>(json['eyeColor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'chName': serializer.toJson<String>(chName),
      'chClass': serializer.toJson<int>(chClass),
      'lvl': serializer.toJson<int>(lvl),
      'imageColor': serializer.toJson<String>(imageColor),
      'imagePath': serializer.toJson<String>(imagePath),
      'textColor': serializer.toJson<String>(textColor),
      'alignment': serializer.toJson<int>(alignment),
      'deiterity': serializer.toJson<String>(deiterity),
      'race': serializer.toJson<int>(race),
      'age': serializer.toJson<int>(age),
      'gender': serializer.toJson<int>(gender),
      'size': serializer.toJson<int>(size),
      'weight': serializer.toJson<double>(weight),
      'height': serializer.toJson<double>(height),
      'hairColor': serializer.toJson<String>(hairColor),
      'eyeColor': serializer.toJson<String>(eyeColor),
    };
  }

  TableCharacterData copyWith(
          {int? id,
          String? chName,
          int? chClass,
          int? lvl,
          String? imageColor,
          String? imagePath,
          String? textColor,
          int? alignment,
          String? deiterity,
          int? race,
          int? age,
          int? gender,
          int? size,
          double? weight,
          double? height,
          String? hairColor,
          String? eyeColor}) =>
      TableCharacterData(
        id: id ?? this.id,
        chName: chName ?? this.chName,
        chClass: chClass ?? this.chClass,
        lvl: lvl ?? this.lvl,
        imageColor: imageColor ?? this.imageColor,
        imagePath: imagePath ?? this.imagePath,
        textColor: textColor ?? this.textColor,
        alignment: alignment ?? this.alignment,
        deiterity: deiterity ?? this.deiterity,
        race: race ?? this.race,
        age: age ?? this.age,
        gender: gender ?? this.gender,
        size: size ?? this.size,
        weight: weight ?? this.weight,
        height: height ?? this.height,
        hairColor: hairColor ?? this.hairColor,
        eyeColor: eyeColor ?? this.eyeColor,
      );
  @override
  String toString() {
    return (StringBuffer('TableCharacterData(')
          ..write('id: $id, ')
          ..write('chName: $chName, ')
          ..write('chClass: $chClass, ')
          ..write('lvl: $lvl, ')
          ..write('imageColor: $imageColor, ')
          ..write('imagePath: $imagePath, ')
          ..write('textColor: $textColor, ')
          ..write('alignment: $alignment, ')
          ..write('deiterity: $deiterity, ')
          ..write('race: $race, ')
          ..write('age: $age, ')
          ..write('gender: $gender, ')
          ..write('size: $size, ')
          ..write('weight: $weight, ')
          ..write('height: $height, ')
          ..write('hairColor: $hairColor, ')
          ..write('eyeColor: $eyeColor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      chName,
      chClass,
      lvl,
      imageColor,
      imagePath,
      textColor,
      alignment,
      deiterity,
      race,
      age,
      gender,
      size,
      weight,
      height,
      hairColor,
      eyeColor);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TableCharacterData &&
          other.id == this.id &&
          other.chName == this.chName &&
          other.chClass == this.chClass &&
          other.lvl == this.lvl &&
          other.imageColor == this.imageColor &&
          other.imagePath == this.imagePath &&
          other.textColor == this.textColor &&
          other.alignment == this.alignment &&
          other.deiterity == this.deiterity &&
          other.race == this.race &&
          other.age == this.age &&
          other.gender == this.gender &&
          other.size == this.size &&
          other.weight == this.weight &&
          other.height == this.height &&
          other.hairColor == this.hairColor &&
          other.eyeColor == this.eyeColor);
}

class TableCharacterCompanion extends UpdateCompanion<TableCharacterData> {
  final Value<int> id;
  final Value<String> chName;
  final Value<int> chClass;
  final Value<int> lvl;
  final Value<String> imageColor;
  final Value<String> imagePath;
  final Value<String> textColor;
  final Value<int> alignment;
  final Value<String> deiterity;
  final Value<int> race;
  final Value<int> age;
  final Value<int> gender;
  final Value<int> size;
  final Value<double> weight;
  final Value<double> height;
  final Value<String> hairColor;
  final Value<String> eyeColor;
  const TableCharacterCompanion({
    this.id = const Value.absent(),
    this.chName = const Value.absent(),
    this.chClass = const Value.absent(),
    this.lvl = const Value.absent(),
    this.imageColor = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.textColor = const Value.absent(),
    this.alignment = const Value.absent(),
    this.deiterity = const Value.absent(),
    this.race = const Value.absent(),
    this.age = const Value.absent(),
    this.gender = const Value.absent(),
    this.size = const Value.absent(),
    this.weight = const Value.absent(),
    this.height = const Value.absent(),
    this.hairColor = const Value.absent(),
    this.eyeColor = const Value.absent(),
  });
  TableCharacterCompanion.insert({
    this.id = const Value.absent(),
    required String chName,
    required int chClass,
    required int lvl,
    required String imageColor,
    required String imagePath,
    required String textColor,
    required int alignment,
    required String deiterity,
    required int race,
    required int age,
    required int gender,
    required int size,
    required double weight,
    required double height,
    required String hairColor,
    required String eyeColor,
  })  : chName = Value(chName),
        chClass = Value(chClass),
        lvl = Value(lvl),
        imageColor = Value(imageColor),
        imagePath = Value(imagePath),
        textColor = Value(textColor),
        alignment = Value(alignment),
        deiterity = Value(deiterity),
        race = Value(race),
        age = Value(age),
        gender = Value(gender),
        size = Value(size),
        weight = Value(weight),
        height = Value(height),
        hairColor = Value(hairColor),
        eyeColor = Value(eyeColor);
  static Insertable<TableCharacterData> custom({
    Expression<int>? id,
    Expression<String>? chName,
    Expression<int>? chClass,
    Expression<int>? lvl,
    Expression<String>? imageColor,
    Expression<String>? imagePath,
    Expression<String>? textColor,
    Expression<int>? alignment,
    Expression<String>? deiterity,
    Expression<int>? race,
    Expression<int>? age,
    Expression<int>? gender,
    Expression<int>? size,
    Expression<double>? weight,
    Expression<double>? height,
    Expression<String>? hairColor,
    Expression<String>? eyeColor,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (chName != null) 'chName': chName,
      if (chClass != null) 'chClass': chClass,
      if (lvl != null) 'lvl': lvl,
      if (imageColor != null) 'imageColor': imageColor,
      if (imagePath != null) 'imagePath': imagePath,
      if (textColor != null) 'textColor': textColor,
      if (alignment != null) '': alignment,
      if (deiterity != null) 'deiterity': deiterity,
      if (race != null) 'race': race,
      if (age != null) 'age': age,
      if (gender != null) 'gender': gender,
      if (size != null) 'size': size,
      if (weight != null) 'weight': weight,
      if (height != null) 'height': height,
      if (hairColor != null) 'hairColor': hairColor,
      if (eyeColor != null) 'eyeColor': eyeColor,
    });
  }

  TableCharacterCompanion copyWith(
      {Value<int>? id,
      Value<String>? chName,
      Value<int>? chClass,
      Value<int>? lvl,
      Value<String>? imageColor,
      Value<String>? imagePath,
      Value<String>? textColor,
      Value<int>? alignment,
      Value<String>? deiterity,
      Value<int>? race,
      Value<int>? age,
      Value<int>? gender,
      Value<int>? size,
      Value<double>? weight,
      Value<double>? height,
      Value<String>? hairColor,
      Value<String>? eyeColor}) {
    return TableCharacterCompanion(
      id: id ?? this.id,
      chName: chName ?? this.chName,
      chClass: chClass ?? this.chClass,
      lvl: lvl ?? this.lvl,
      imageColor: imageColor ?? this.imageColor,
      imagePath: imagePath ?? this.imagePath,
      textColor: textColor ?? this.textColor,
      alignment: alignment ?? this.alignment,
      deiterity: deiterity ?? this.deiterity,
      race: race ?? this.race,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      size: size ?? this.size,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      hairColor: hairColor ?? this.hairColor,
      eyeColor: eyeColor ?? this.eyeColor,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (chName.present) {
      map['chName'] = Variable<String>(chName.value);
    }
    if (chClass.present) {
      map['chClass'] = Variable<int>(chClass.value);
    }
    if (lvl.present) {
      map['lvl'] = Variable<int>(lvl.value);
    }
    if (imageColor.present) {
      map['imageColor'] = Variable<String>(imageColor.value);
    }
    if (imagePath.present) {
      map['imagePath'] = Variable<String>(imagePath.value);
    }
    if (textColor.present) {
      map['textColor'] = Variable<String>(textColor.value);
    }
    if (alignment.present) {
      map[''] = Variable<int>(alignment.value);
    }
    if (deiterity.present) {
      map['deiterity'] = Variable<String>(deiterity.value);
    }
    if (race.present) {
      map['race'] = Variable<int>(race.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (gender.present) {
      map['gender'] = Variable<int>(gender.value);
    }
    if (size.present) {
      map['size'] = Variable<int>(size.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (height.present) {
      map['height'] = Variable<double>(height.value);
    }
    if (hairColor.present) {
      map['hairColor'] = Variable<String>(hairColor.value);
    }
    if (eyeColor.present) {
      map['eyeColor'] = Variable<String>(eyeColor.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TableCharacterCompanion(')
          ..write('id: $id, ')
          ..write('chName: $chName, ')
          ..write('chClass: $chClass, ')
          ..write('lvl: $lvl, ')
          ..write('imageColor: $imageColor, ')
          ..write('imagePath: $imagePath, ')
          ..write('textColor: $textColor, ')
          ..write('alignment: $alignment, ')
          ..write('deiterity: $deiterity, ')
          ..write('race: $race, ')
          ..write('age: $age, ')
          ..write('gender: $gender, ')
          ..write('size: $size, ')
          ..write('weight: $weight, ')
          ..write('height: $height, ')
          ..write('hairColor: $hairColor, ')
          ..write('eyeColor: $eyeColor')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $TableCharacterTable tableCharacter = $TableCharacterTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tableCharacter];
}
