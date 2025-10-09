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
