import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/screens/characrer_sheet/character_sheet_wm.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class DrBlock extends StatelessWidget {
  final ICharacterSheetWM wm;
  final DrSrControllers controllers;

  const DrBlock({required this.wm, required this.controllers, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: SizedBox(
            height: 105.0,
            width: double.infinity,
            child: Stack(children: [
              Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  height: 100.0,
                  width: double.infinity,
                  child: CustomPaint(
                    painter: DrSrBorderPainter(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4.0, vertical: 12.0),
                      child: TextFormField(
                        controller: controllers.drController,
                        expands: true,
                        maxLines: null,
                        cursorColor: AppColors.darkPink,
                        style: AppStyles.commonPixel(),
                        textAlign: TextAlign.justify,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 4.0, top: 4.0),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'DRs',
                  style: AppStyles.commonPixel()
                      .copyWith(color: AppColors.darkPink),
                ),
              )
            ]),
          ),
        ),
        const SizedBox(
          width: 12.0,
        ),
        Expanded(
          child: SizedBox(
            height: 105.0,
            width: double.infinity,
            child: Stack(children: [
              Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  height: 100.0,
                  width: double.infinity,
                  child: CustomPaint(
                    painter: DrSrBorderPainter(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4.0, vertical: 12.0),
                      child: TextFormField(
                        controller: controllers.srController,
                        expands: true,
                        maxLines: null,
                        cursorColor: AppColors.darkPink,
                        style: AppStyles.commonPixel(),
                        textAlign: TextAlign.justify,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 4.0, top: 4.0),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'SRs',
                  style: AppStyles.commonPixel()
                      .copyWith(color: AppColors.darkPink),
                ),
              )
            ]),
          ),
        ),
      ],
    );
  }
}

class DrSrBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const cut = 0.1;

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

class DrSrControllers {
  final TextEditingController drController;
  final TextEditingController srController;

  const DrSrControllers(
      {required this.drController, required this.srController});
}
