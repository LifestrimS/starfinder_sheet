import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class BabBlock extends StatefulWidget {
  final BabControllers controllers;
  final ValueNotifier dexModificatorNotifier;
  final ValueNotifier strModificatorNotifier;

  final ValueNotifier<int> babNotifier = ValueNotifier(0);

  BabBlock(
      {required this.controllers,
      required this.dexModificatorNotifier,
      required this.strModificatorNotifier,
      super.key});

  @override
  State<BabBlock> createState() => _BabBlockState();
}

class _BabBlockState extends State<BabBlock> {
  @override
  void initState() {
    widget.babNotifier.value = int.parse(widget.controllers.babController.text);
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
          child: Stack(children: [
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
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 4.0)),
                        onChanged: (value) =>
                            widget.babNotifier.value = int.parse(value),
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
                style: AppStyles.commonPixel()
                    .copyWith(color: AppColors.darkPink, fontSize: 6.0),
              ),
            )
          ]),
        ),
        Text(
          ':',
          style: AppStyles.commonPixel(),
        ),
        ValueListenableBuilder(
            valueListenable: widget.strModificatorNotifier,
            builder: (context, strMod, child) {
              return ValueListenableBuilder(
                  valueListenable: widget.babNotifier,
                  builder: (context, bab, child) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await showDialog(
                                  context: context,
                                  builder: (context) => babDialog(context,
                                      babType: BabType.mab,
                                      abilityMod: strMod,
                                      bab:
                                          widget.controllers.babController.text,
                                      miscController:
                                          widget.controllers.mabMiscController,
                                      tempController: widget
                                          .controllers.mabTempController));
                              setState(() {});
                            },
                            child: SizedBox(
                              height: 47.0,
                              width: 65.0,
                              child: Stack(children: [
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: SizedBox(
                                    height: 40.0,
                                    width: 60.0,
                                    child: CustomPaint(
                                      painter: BabBorderPainter(),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 4.0),
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
                                        fontSize: 6.0),
                                  ),
                                )
                              ]),
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          GestureDetector(
                            onTap: () async {
                              await showDialog(
                                  context: context,
                                  builder: (context) => babDialog(context,
                                      babType: BabType.tab,
                                      abilityMod: strMod,
                                      bab:
                                          widget.controllers.babController.text,
                                      miscController:
                                          widget.controllers.tabMiscController,
                                      tempController: widget
                                          .controllers.tabTempController));
                              setState(() {});
                            },
                            child: SizedBox(
                              height: 47.0,
                              width: 65.0,
                              child: Stack(children: [
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: SizedBox(
                                    height: 40.0,
                                    width: 60.0,
                                    child: CustomPaint(
                                      painter: BabBorderPainter(),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 4.0),
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
                                        fontSize: 6.0),
                                  ),
                                )
                              ]),
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          ValueListenableBuilder(
                              valueListenable: widget.dexModificatorNotifier,
                              builder: (context, dexMod, child) {
                                return GestureDetector(
                                  onTap: () async {
                                    await showDialog(
                                        context: context,
                                        builder: (context) => babDialog(context,
                                            babType: BabType.rab,
                                            abilityMod: dexMod,
                                            bab: widget
                                                .controllers.babController.text,
                                            miscController: widget
                                                .controllers.rabMiscController,
                                            tempController: widget.controllers
                                                .rabTempController));
                                    setState(() {});
                                  },
                                  child: SizedBox(
                                    height: 47.0,
                                    width: 65.0,
                                    child: Stack(children: [
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: SizedBox(
                                          height: 40.0,
                                          width: 60.0,
                                          child: CustomPaint(
                                            painter: BabBorderPainter(),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4.0),
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
                                          style: AppStyles.commonPixel()
                                              .copyWith(
                                                  color: AppColors.darkPink,
                                                  fontSize: 6.0),
                                        ),
                                      )
                                    ]),
                                  ),
                                );
                              }),
                        ],
                      ),
                    );
                  });
            }),
      ],
    );
  }

  String getValue(BabType type, int modificator) {
    int value = 0;
    switch (type) {
      case BabType.mab:
        value = int.parse(widget.controllers.babController.text) +
            modificator +
            int.parse(widget.controllers.mabMiscController.text) +
            int.parse(widget.controllers.mabTempController.text);
        break;
      case BabType.tab:
        value = int.parse(widget.controllers.babController.text) +
            modificator +
            int.parse(widget.controllers.tabMiscController.text) +
            int.parse(widget.controllers.tabTempController.text);
        break;
      case BabType.rab:
        value = int.parse(widget.controllers.babController.text) +
            modificator +
            int.parse(widget.controllers.rabMiscController.text) +
            int.parse(widget.controllers.rabTempController.text);
        break;
    }

    return value.toString();
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

Widget babDialog(
  BuildContext context, {
  required BabType babType,
  required int abilityMod,
  required String bab,
  required TextEditingController miscController,
  required TextEditingController tempController,
}) {
  return AlertDialog(
    insetPadding: EdgeInsets.zero,
    title: Text(
      babType == BabType.mab
          ? 'MAB'
          : babType == BabType.rab
              ? 'RAB'
              : 'TAB',
      style: AppStyles.commonPixel().copyWith(color: AppColors.darkPink),
    ),
    backgroundColor: AppColors.backgroundDark,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.all(Radius.zero)),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              bab,
              style: AppStyles.commonPixel(),
            ),
            Text(
              ' + ',
              style: AppStyles.commonPixel(),
            ),
            Text(
              abilityMod.toString(),
              style: AppStyles.commonPixel(),
            ),
            Text(
              ' + ',
              style: AppStyles.commonPixel(),
            ),
            DialogBox(
              title: 'Misc',
              controller: miscController,
            ),
            Text(
              ' + ',
              style: AppStyles.commonPixel(),
            ),
            DialogBox(
              title: 'Temp',
              controller: tempController,
            ),
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Done",
                style: AppStyles.commonPixel(),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

class DialogBox extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool isEnable;

  const DialogBox(
      {required this.title,
      required this.controller,
      this.isEnable = true,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppStyles.commonPixel()
              .copyWith(fontSize: 6.0, color: AppColors.darkPink),
        ),
        const SizedBox(
          height: 4.0,
        ),
        SizedBox(
          height: 30.0,
          width: 40.0,
          child: CustomPaint(
            painter: DialogFramePainter(),
            child: TextFormField(
              controller: controller,
              //initialValue: '13',
              expands: true,
              maxLines: null,
              enabled: isEnable,
              style: AppStyles.commonPixel(),
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(left: 4.0, top: 4.0),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 18.0,
        ),
      ],
    );
  }
}

class DialogFramePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const cut = 0.1;
    final widthCut = size.width * cut;

    Paint paintFrame = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..color = AppColors.teal;
    Path pathFrame = Path();

    pathFrame.moveTo(0.0, 0.0);
    pathFrame.lineTo(size.width - widthCut, 0.0);
    pathFrame.lineTo(size.width, 0.0 + widthCut);
    pathFrame.lineTo(size.width, size.height);
    pathFrame.lineTo(0.0 + widthCut, size.height);
    pathFrame.lineTo(0.0, size.height - widthCut);
    pathFrame.close();
    canvas.drawPath(pathFrame, paintFrame);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

enum BabType { mab, tab, rab }
