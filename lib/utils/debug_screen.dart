import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';
import 'package:pathfinder_sheet/repository/db_repository.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class DebugScreen extends StatelessWidget {
  const DebugScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text('Debug', style: AppStyles.commonPixel()),
        ),
        backgroundColor: AppColors.darkBlue,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: AppColors.textContrastDark),
        ),
      ),
      backgroundColor: AppColors.backgroundDark,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: deleteAllCharaters,
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Delete all characters',
                  style: AppStyles.commonPixel(),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: addEmptyCharacter,
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Add empty character',
                  style: AppStyles.commonPixel(),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: getAllCharaters,
              child: SizedBox(
                width: double.infinity,
                child: Text('Get all', style: AppStyles.commonPixel()),
              ),
            ),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: addCharacterWithWeapon,
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Add character with weapon',
                  style: AppStyles.commonPixel(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getAllCharaters() async {
    try {
      List<Character> characters = await GetIt.I
          .get<Repository>()
          .getAllCharacter();
      log('All characters lenght: ${characters.length}:\n$characters');
    } catch (e) {
      log('Smthing get worng on get all characters: $e');
    }
  }

  void deleteAllCharaters() {
    try {
      GetIt.I.get<Repository>().deleteAllCharacters();
      log('All characters deleted');
    } catch (e) {
      log('Smthing get worng on delete all characters: $e');
    }
  }

  void addEmptyCharacter() {
    try {
      GetIt.I.get<Repository>().addCharacter(Character.empty());
      log('Added empty character');
    } catch (e) {
      log('Smthing get worng on add empty character: $e');
    }
  }

  void addCharacterWithWeapon() async {
    WeaponList weaponList = const WeaponList(
      weapons: [
        Weapon(
          name: 'name',
          attackBonus: 'attackBonus',
          crit: 'crit',
          special: 'special',
          range: 'range',
          damage: 'damage',
          size: 'size',
          type: 'type',
          capacity: 'capacity',
          usages: 'usages',
        ),
        Weapon(
          name: 'name2',
          attackBonus: 'attackBonus',
          crit: 'crit',
          special: 'special',
          range: 'range',
          damage: 'damage',
          size: 'size',
          type: 'type',
          capacity: 'capacity',
          usages: 'usages',
        ),
      ],
    );

    Character newChar = Character.empty().copyWith(weaponList: weaponList);
    try {
      GetIt.I.get<Repository>().addCharacter(newChar);
      log('Added character with weapon');
    } catch (e) {
      log('Smthing get worng on add character with weapon: $e');
    }
  }
}
