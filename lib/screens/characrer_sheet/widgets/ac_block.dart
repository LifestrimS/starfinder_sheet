import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class ACBlock extends StatefulWidget {
  final AcControllers eacControllers;
  final AcControllers kacControllers;
  final ValueNotifier<int> dexModificatorNotifier;

  const ACBlock(
      {required this.eacControllers,
      required this.kacControllers,
      required this.dexModificatorNotifier,
      super.key});

  @override
  State<ACBlock> createState() => _ACBlockState();
}

class _ACBlockState extends State<ACBlock> {
  final ValueNotifier<int> eacNotifier = ValueNotifier(0);

  final ValueNotifier kacNotifier = ValueNotifier(0);

  @override
  void initState() {
    update(isEac: true);
    update(isEac: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: widget.dexModificatorNotifier,
        builder: (context, dexModificator, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (context) => aCDialog(context,
                        isEAC: true,
                        controllers: widget.eacControllers,
                        dexModificator: dexModificator),
                  );
                  update(isEac: true);
                },
                child: SizedBox(
                  height: 57.0,
                  width: 75.0,
                  child: Stack(children: [
                    ValueListenableBuilder(
                      valueListenable: eacNotifier,
                      builder: (context, value, child) {
                        return Align(
                          alignment: Alignment.bottomRight,
                          child: SizedBox(
                            height: 50.0,
                            width: 70.0,
                            child: CustomPaint(
                              painter: ACBorderPainter(),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Center(
                                  child: Text(
                                    value.toString(),
                                    style: AppStyles.commonPixel()
                                        .copyWith(fontSize: 14.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'EAC',
                        style: AppStyles.commonPixel()
                            .copyWith(color: AppColors.darkPink, fontSize: 6.0),
                      ),
                    )
                  ]),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (context) => aCDialog(context,
                        isEAC: false,
                        controllers: widget.kacControllers,
                        dexModificator: dexModificator),
                  );
                  update(isEac: false);
                },
                child: SizedBox(
                  height: 55.0,
                  width: 75.0,
                  child: Stack(children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: SizedBox(
                        height: 50.0,
                        width: 70.0,
                        child: CustomPaint(
                          painter: ACBorderPainter(),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Center(
                              child: Text(
                                countAC(widget.kacControllers).toString(),
                                style: AppStyles.commonPixel()
                                    .copyWith(fontSize: 14.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'KAC',
                        style: AppStyles.commonPixel()
                            .copyWith(color: AppColors.darkPink, fontSize: 6.0),
                      ),
                    )
                  ]),
                ),
              ),
            ],
          );
        });
  }

  int countAC(AcControllers controllers) {
    return 10 +
        widget.dexModificatorNotifier.value +
        int.parse(controllers.armorController.text) +
        int.parse(controllers.dodgeController.text) +
        int.parse(controllers.naturalController.text) +
        int.parse(controllers.deflectController.text) +
        int.parse(controllers.miscController.text);
  }

  void update({required bool isEac}) {
    if (isEac) {
      eacNotifier.value = countAC(widget.eacControllers);
    } else {
      kacNotifier.value = countAC(widget.kacControllers);
    }
  }
}

Widget aCDialog(
  BuildContext context, {
  required bool isEAC,
  required int dexModificator,
  required AcControllers controllers,
}) {
  return AlertDialog(
    insetPadding: EdgeInsets.zero,
    title: Text(
      isEAC ? 'EAC' : 'KAC',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                '10',
                style: AppStyles.commonPixel(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                ' + ',
                style: AppStyles.commonPixel(),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'DEX',
                  style: AppStyles.commonPixel()
                      .copyWith(fontSize: 6.0, color: AppColors.darkPink),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 30.0,
                  width: 40.0,
                  child: Text(
                    dexModificator.toString(),
                    textAlign: TextAlign.center,
                    style: AppStyles.commonPixel(),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                ' + ',
                style: AppStyles.commonPixel(),
              ),
            ),
            DialogBox(
              title: 'Armor',
              controller: controllers.armorController,
              isEnable: false,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                ' + ',
                style: AppStyles.commonPixel(),
              ),
            ),
            DialogBox(
              title: 'Dodge',
              controller: controllers.dodgeController,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                ' + ',
                style: AppStyles.commonPixel(),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              ' + ',
              style: AppStyles.commonPixel(),
            ),
            DialogBox(
              title: 'Natural',
              controller: controllers.naturalController,
            ),
            Text(
              ' + ',
              style: AppStyles.commonPixel(),
            ),
            DialogBox(
              title: 'Deflect',
              controller: controllers.deflectController,
            ),
            Text(
              ' + ',
              style: AppStyles.commonPixel(),
            ),
            DialogBox(
              title: 'Misc',
              controller: controllers.miscController,
            )
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

class ACBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const cut = 0.15;

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

class AcControllers {
  final TextEditingController armorController;
  final TextEditingController dexController;
  final TextEditingController dodgeController;
  final TextEditingController naturalController;
  final TextEditingController deflectController;
  final TextEditingController miscController;

  const AcControllers(
      {required this.armorController,
      required this.dexController,
      required this.dodgeController,
      required this.naturalController,
      required this.deflectController,
      required this.miscController});
}
