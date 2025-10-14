// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeaponList _$WeaponListFromJson(Map<String, dynamic> json) => WeaponList(
  weapons: (json['weapons'] as List<dynamic>)
      .map((e) => Weapon.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$WeaponListToJson(WeaponList instance) =>
    <String, dynamic>{'weapons': instance.weapons};

ArmorList _$ArmorListFromJson(Map<String, dynamic> json) => ArmorList(
  armors: (json['armors'] as List<dynamic>)
      .map((e) => Armor.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ArmorListToJson(ArmorList instance) => <String, dynamic>{
  'armors': instance.armors,
};
