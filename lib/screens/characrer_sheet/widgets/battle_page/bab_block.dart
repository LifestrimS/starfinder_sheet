import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pathfinder_sheet/util_widgets/dialog.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';
import 'package:pathfinder_sheet/utils/utils.dart';

class BabBlock extends StatefulWidget {
  final BabControllers controllers;
  final ValueNotifier dexModificatorNotifier;
  final ValueNotifier strModificatorNotifier;

  final ValueNotifier<int> babNotifier = ValueNotifier(0);

  BabBlock({
    required this.controllers,
    required this.dexModificatorNotifier,
    required this.strModificatorNotifier,
    super.key,
  });

  @override
  State<BabBlock> createState() => _BabBlockState();
}

class _BabBlockState extends State<BabBlock> {
  @override
  void initState() {
    widget.babNotifier.value = parseIntFromString(
      widget.controllers.babController.text,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: 47.0,
          width: 65.0,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  height: 40.0,
                  width: 60.0,
                  child: CustomPaint(
                    painter: BabBorderPainter(),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Center(
                        child: TextFormField(
                          controller: widget.controllers.babController,
                          expands: true,
                          maxLines: null,
                          style: AppStyles.commonPixel(),
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.number,
                          onTapOutside: (event) =>
                              FocusManager.instance.primaryFocus?.unfocus(),
                          cursorColor: AppColors.darkPink,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 4.0),
                          ),
                          onChanged: (value) => widget.babNotifier.value =
                              parseIntFromString(value),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r'[0-9]*'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'BAB',
                  style: AppStyles.commonPixel().copyWith(
                    color: AppColors.darkPink,
                    fontSize: 6.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 4.0),
          child: Text(':', style: AppStyles.commonPixel()),
        ),
        ValueListenableBuilder(
          valueListenable: widget.strModificatorNotifier,
          builder: (context, strMod, child) {
            return ValueListenableBuilder(
              valueListenable: widget.babNotifier,
              builder: (context, bab, child) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await showDialog(
                            context: context,
                            builder: (context) => CustomDialog(
                              content: dialogContent(
                                context: context,
                                title: 'MAB',
                                abilityMod: strMod,
                                bab: widget.controllers.babController.text,
                                miscController:
                                    widget.controllers.mabMiscController,
                                tempController:
                                    widget.controllers.mabTempController,
                              ),
                            ),
                          );
                          setState(() {});
                        },
                        child: SizedBox(
                          height: 47.0,
                          width: 65.0,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomRight,
                                child: SizedBox(
                                  height: 40.0,
                                  width: 60.0,
                                  child: CustomPaint(
                                    painter: BabBorderPainter(),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Center(
                                        child: Text(
                                          getValue(BabType.mab, strMod),
                                          style: AppStyles.commonPixel()
                                              .copyWith(fontSize: 10.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'MAB',
                                  style: AppStyles.commonPixel().copyWith(
                                    color: AppColors.darkPink,
                                    fontSize: 6.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      GestureDetector(
                        onTap: () async {
                          await showDialog(
                            context: context,
                            builder: (context) => CustomDialog(
                              content: dialogContent(
                                context: context,
                                title: 'TAB',
                                abilityMod: strMod,
                                bab: widget.controllers.babController.text,
                                miscController:
                                    widget.controllers.tabMiscController,
                                tempController:
                                    widget.controllers.tabTempController,
                              ),
                            ),
                          );

                          setState(() {});
                        },
                        child: SizedBox(
                          height: 47.0,
                          width: 65.0,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomRight,
                                child: SizedBox(
                                  height: 40.0,
                                  width: 60.0,
                                  child: CustomPaint(
                                    painter: BabBorderPainter(),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Center(
                                        child: Text(
                                          getValue(BabType.tab, strMod),
                                          style: AppStyles.commonPixel()
                                              .copyWith(fontSize: 10.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'TAB',
                                  style: AppStyles.commonPixel().copyWith(
                                    color: AppColors.darkPink,
                                    fontSize: 6.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      ValueListenableBuilder(
                        valueListenable: widget.dexModificatorNotifier,
                        builder: (context, dexMod, child) {
                          return GestureDetector(
                            onTap: () async {
                              await showDialog(
                                context: context,
                                builder: (context) => CustomDialog(
                                  content: dialogContent(
                                    context: context,
                                    title: 'RAB',
                                    abilityMod: dexMod,
                                    bab: widget.controllers.babController.text,
                                    miscController:
                                        widget.controllers.rabMiscController,
                                    tempController:
                                        widget.controllers.rabTempController,
                                  ),
                                ),
                              );
                              setState(() {});
                            },
                            child: SizedBox(
                              height: 47.0,
                              width: 65.0,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: SizedBox(
                                      height: 40.0,
                                      width: 60.0,
                                      child: CustomPaint(
                                        painter: BabBorderPainter(),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 4.0,
                                          ),
                                          child: Center(
                                            child: Text(
                                              getValue(BabType.rab, dexMod),
                                              style: AppStyles.commonPixel()
                                                  .copyWith(fontSize: 10.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'RAB',
                                      style: AppStyles.commonPixel().copyWith(
                                        color: AppColors.darkPink,
                                        fontSize: 6.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  String getValue(BabType type, int modificator) {
    int value = 0;
    switch (type) {
      case BabType.mab:
        value =
            parseIntFromString(widget.controllers.babController.text) +
            modificator +
            parseIntFromString(widget.controllers.mabMiscController.text) +
            parseIntFromString(widget.controllers.mabTempController.text);
        break;
      case BabType.tab:
        value =
            parseIntFromString(widget.controllers.babController.text) +
            modificator +
            parseIntFromString(widget.controllers.tabMiscController.text) +
            parseIntFromString(widget.controllers.tabTempController.text);
        break;
      case BabType.rab:
        value =
            parseIntFromString(widget.controllers.babController.text) +
            modificator +
            parseIntFromString(widget.controllers.rabMiscController.text) +
            parseIntFromString(widget.controllers.rabTempController.text);
        break;
    }

    return value.toString();
  }

  Widget dialogContent({
    required BuildContext context,
    required String title,
    required int abilityMod,
    required String bab,
    required TextEditingController miscController,
    required TextEditingController tempController,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.commonPixel().copyWith(color: AppColors.darkPink),
          ),
          const SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DialogBox(title: 'BAB', value: bab),
              plusSymbol(),
              DialogBox(title: 'Abil', value: abilityMod.toString()),
              plusSymbol(),
              DialogBox(title: 'Misc', controller: miscController),
              plusSymbol(),
              DialogBox(title: 'Temp', controller: tempController),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text("Done", style: AppStyles.commonPixel()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget plusSymbol() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 6.0),
      child: Text('+', style: AppStyles.commonPixel()),
    );
  }
}

class BabBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const cut = 0.17;

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..color = AppColors.teal;
    Path path = Path();

    path.moveTo(size.width * (cut * 2), 0.0);

    path.lineTo(size.width * (1 - cut), 0.0);
    path.lineTo(size.width, size.height * cut);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * cut, size.height);
    path.lineTo(0.0, size.height * (1 - cut));
    path.lineTo(0.0, size.height * cut * 1.2);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class BabControllers {
  final TextEditingController babController;
  final TextEditingController mabMiscController;
  final TextEditingController mabTempController;
  final TextEditingController tabMiscController;
  final TextEditingController tabTempController;
  final TextEditingController rabMiscController;
  final TextEditingController rabTempController;

  const BabControllers({
    required this.babController,
    required this.mabMiscController,
    required this.mabTempController,
    required this.tabMiscController,
    required this.tabTempController,
    required this.rabMiscController,
    required this.rabTempController,
  });
}

class DialogBox extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final String? value;

  const DialogBox({
    required this.title,
    this.controller,
    this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.0,
      width: 55.0,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              height: 40.0,
              width: 50.0,
              child: CustomPaint(
                painter: DialogFramePainter(),
                child: controller != null
                    ? TextFormField(
                        controller: controller,
                        //initialValue: '13',
                        expands: true,
                        maxLines: null,
                        style: AppStyles.commonPixel(),
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.number,
                        onTapOutside: (event) =>
                            FocusManager.instance.primaryFocus?.unfocus(),
                        cursorColor: AppColors.darkPink,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 4.0, top: 4.0),
                          border: InputBorder.none,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'^-?[0-9]*'),
                          ),
                        ],
                      )
                    : Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            value ?? '',
                            style: AppStyles.commonPixel(),
                          ),
                        ),
                      ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: AppStyles.commonPixel().copyWith(
                color: AppColors.darkPink,
                fontSize: 6.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DialogFramePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const cut = 0.17;

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..color = AppColors.teal;
    Path path = Path();

    path.moveTo(size.width * (cut * 3), 0.0);
    path.lineTo(size.width * (1 - cut), 0.0);
    path.lineTo(size.width, size.height * cut);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * cut, size.height);
    path.lineTo(0.0, size.height * (1 - cut));
    path.lineTo(0.0, size.height * cut * 1.2);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

enum BabType { mab, tab, rab }
