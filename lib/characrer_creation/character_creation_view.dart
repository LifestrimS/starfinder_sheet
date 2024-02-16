import 'dart:developer';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/characrer_creation/character_creation_wm.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';
import 'package:pathfinder_sheet/utils/theme.dart';
import 'package:pathfinder_sheet/widgets/button.dart';
import 'package:pathfinder_sheet/widgets/textfield.dart';

class CharacterCreationView extends ElementaryWidget<CharacterCreationWM> {
  const CharacterCreationView({Key? key})
      : super(createCharacterCreationWM, key: key);

  @override
  Widget build(CharacterCreationWM wm) {
    AppTheme theme = wm.theme;
    return Scaffold(
      backgroundColor: wm.theme.getBackgroundColor(),
      body: ValueListenableBuilder(
          valueListenable: wm.imagePathNotifier,
          builder: (context, imagePath, child) {
            return ValueListenableBuilder(
                valueListenable: wm.textImageColor,
                builder: (context, textImageColor, child) {
                  return ValueListenableBuilder(
                      valueListenable: wm.backgroundColor,
                      builder: (context, backgroundColor, child) {
                        return CustomScrollView(slivers: [
                          SliverAppBar(
                            expandedHeight: 250.0,
                            collapsedHeight: 70.0,
                            scrolledUnderElevation: 0.0,
                            backgroundColor: imagePath != null
                                ? Colors.transparent
                                : backgroundColor,
                            pinned: false,
                            flexibleSpace: FlexibleSpaceBar(
                              background: imagePath == null
                                  ? null
                                  : Image.file(
                                      imagePath,
                                      fit: BoxFit.fitWidth,
                                    ),
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name',
                                    style: TextStyle(
                                        color: textImageColor, fontSize: 32.0),
                                  ),
                                  Text(
                                    'Class',
                                    style: TextStyle(
                                        color: textImageColor, fontSize: 20.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              childCount: 1,
                              (_, int index) {
                                return Container(
                                  width: double.infinity,
                                  color: wm.theme.getBackgroundColor(),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        deviderTitleBlock(
                                            title: 'Image', theme: theme),
                                        const SizedBox(
                                          height: 25.0,
                                        ),
                                        imageBlock(wm: wm),
                                        const SizedBox(
                                          height: 20.0,
                                        ),
                                        deviderTitleBlock(
                                            title: 'BIO', theme: theme),
                                        const SizedBox(
                                          height: 25.0,
                                        ),
                                        ...bioBlock(theme: theme, wm: wm),
                                        const SizedBox(
                                          height: 25.0,
                                        ),
                                        Button(
                                          theme: theme,
                                          title: 'Save',
                                          onTap: wm.save,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ]);
                      });
                });
          }),
    );
  }

  Widget imageBlock({required CharacterCreationWM wm}) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 130.0,
          width: wm.getColumnWidth(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Button(
                  theme: wm.theme,
                  title: 'Image',
                  width: 120.0,
                  height: 45.0,
                  onTap: wm.pickImage),
              const SizedBox(
                height: 10.0,
              ),
              ColorButton(
                  theme: wm.theme,
                  title: 'Text Color',
                  textBWidth: 80.0,
                  colorWidth: 40.0,
                  height: 45.0,
                  initialColor: Colors.white,
                  colorNotifier: wm.textImageColor,
                  onTap: () {}),
              const SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: wm.deleteImage,
                child: Container(
                  height: 20.0,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 107, 28, 22),
                      border:
                          Border.all(color: wm.theme.getTextContrastColor()),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0))),
                  child: Center(
                    child: Text(
                      'Delete image',
                      style: TextStyle(
                          color: wm.theme.getTextContrastColor(),
                          fontSize: 10.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text('or',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: wm.theme.getTextContrastColor(), fontSize: 26.0)),
        ),
        SizedBox(
          height: 130.0,
          width: wm.getColumnWidth(),
          child: Column(
            children: [
              ColorButton(
                  theme: wm.theme,
                  title: 'Color image',
                  textBWidth: 80.0,
                  colorWidth: 40.0,
                  height: 45.0,
                  colorNotifier: wm.backgroundColor,
                  onTap: () {
                    log('tapColor');
                  }),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'Choose color for text on your image',
                style: TextStyle(
                    color: wm.theme.getTextContrastColor(), fontSize: 15.0),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget deviderTitleBlock({required String title, required AppTheme theme}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 1.0,
          color: theme.getTextContrastColor(),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 15.0, color: theme.getTextContrastColor()),
        )
      ],
    );
  }

  List<Widget> bioBlock(
      {required AppTheme theme, required CharacterCreationWM wm}) {
    return [
      CommonTextField(
        labelText: 'Name',
        theme: theme,
        controller: wm.nameTextController,
      ),
      const SizedBox(
        height: 15.0,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: DropdownField(
              labelText: 'Alingnment',
              theme: theme,
              width: 100.0,
              listStringItems: CharAlignment.values.map((e) => e.name).toList(),
              notifier: wm.alignmentNotifier,
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            flex: 2,
            child: CommonTextField(
              labelText: 'Deiterity',
              theme: theme,
              width: 200.0,
              controller: wm.deiterityTextController,
            ),
          )
        ],
      ),
      const SizedBox(
        height: 15.0,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: DropdownField(
              labelText: 'Race',
              theme: theme,
              width: 200.0,
              notifier: wm.racetNotifier,
              listStringItems: Race.values.map((e) => e.name).toList(),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            flex: 1,
            child: CommonTextField(
              labelText: 'Age',
              theme: theme,
              width: 100.0,
              controller: wm.ageTextController,
              textInputType: TextInputType.number,
            ),
          )
        ],
      ),
      const SizedBox(
        height: 15.0,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: DropdownField(
              labelText: 'Gender',
              theme: theme,
              width: 150.0,
              notifier: wm.genderNotifier,
              listStringItems: Gender.values.map((e) => e.name).toList(),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            flex: 1,
            child: DropdownField(
              labelText: 'Size',
              theme: theme,
              width: 150.0,
              notifier: wm.sizeNotifier,
              listStringItems: Size.values.map((e) => e.name).toList(),
            ),
          )
        ],
      ),
      const SizedBox(
        height: 15.0,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: CommonTextField(
              labelText: 'Weight',
              theme: theme,
              width: 150.0,
              controller: wm.weightTextController,
              textInputType: TextInputType.number,
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            flex: 1,
            child: CommonTextField(
              labelText: 'Height',
              theme: theme,
              width: 150.0,
              controller: wm.heightTextController,
              textInputType: TextInputType.number,
            ),
          )
        ],
      ),
      const SizedBox(
        height: 15.0,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: ColorButton(
              title: 'Eye color',
              theme: theme,
              textBWidth: 100.0,
              colorWidth: 50.0,
              height: 45.0,
              onTap: () {},
              colorNotifier: wm.eyeColor,
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            flex: 1,
            child: ColorButton(
              title: 'Hair color',
              theme: theme,
              textBWidth: 100.0,
              colorWidth: 50.0,
              height: 45.0,
              onTap: () {},
              colorNotifier: wm.hairColor,
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15.0,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: DropdownField(
              labelText: 'Class',
              theme: theme,
              width: 150.0,
              notifier: wm.classNotifier,
              listStringItems: ChClass.values.map((e) => e.name).toList(),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            flex: 1,
            child: CommonTextField(
              labelText: 'Lvl',
              theme: theme,
              width: 150.0,
              controller: wm.lvlTextController,
              textInputType: TextInputType.number,
            ),
          )
        ],
      )
    ];
  }
}

//TODO: chevrons with collapsing parts
//TODO: Flexible containers