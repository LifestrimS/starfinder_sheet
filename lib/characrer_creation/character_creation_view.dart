import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pathfinder_sheet/characrer_creation/character_creation_wm.dart';
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
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: AppBar(
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
                onPressed: wm.goBack,
                icon: Icon(
                  Icons.arrow_back,
                  color: theme.getTextColor(),
                )),
            actions: [
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: SvgPicture.asset(
                    'assets/images/icons/settings.svg',
                    width: 32.0,
                    height: 32.0,
                    alignment: Alignment.centerRight,
                    colorFilter:
                        ColorFilter.mode(theme.getTextColor(), BlendMode.srcIn),
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: theme.getAccent1Color(),
        body: Column(
          children: [
            //Image
            Container(
              height: 190.0,
              color: theme.getAccent1Color(),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0)),
                child: Container(
                  width: double.infinity,
                  color: wm.theme.getBackgroundColor(),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...imageBlock(wm: wm),
                        const SizedBox(
                          height: 20.0,
                        ),
                        deviderTitleBlock(title: 'BIO', theme: theme),
                        const SizedBox(
                          height: 25.0,
                        ),
                        ...bioBlock(theme: theme),
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
                ),
              ),
            ),
          ],
        ));
  }

  List<Widget> imageBlock({required CharacterCreationWM wm}) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Button(
              theme: wm.theme,
              title: 'Image',
              width: 120.0,
              height: 45.0,
              onTap: () {}),
          const SizedBox(
            width: 20.0,
          ),
          Text('or',
              style: TextStyle(
                  color: wm.theme.getTextContrastColor(), fontSize: 26.0)),
          const SizedBox(
            width: 20.0,
          ),
          ColorButton(
              theme: wm.theme,
              title: 'Color image',
              textBWidth: 80.0,
              colorWidth: 40.0,
              height: 45.0,
              onTap: () {})
        ],
      ),
      const SizedBox(
        height: 10.0,
      ),
      Row(
        children: [
          ColorButton(
              theme: wm.theme,
              title: 'Text Color',
              textBWidth: 80.0,
              colorWidth: 40.0,
              height: 45.0,
              onTap: () {}),
          const SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: Text(
              'Choose color for text on your image',
              style: TextStyle(
                  color: wm.theme.getTextContrastColor(), fontSize: 15.0),
            ),
          ),
        ],
      )
    ];
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

  List<Widget> bioBlock({required AppTheme theme}) {
    return [
      CustomTextField(
        labelText: 'Name',
        theme: theme,
      )
    ];
  }
}
