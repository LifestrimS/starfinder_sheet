import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/utils/colors.dart';

class ContentBlock extends StatelessWidget {
  const ContentBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      //width: 550.0,
      child: CustomPaint(
        painter: ContentBorderPainter(),
        child: Container(),
      ),
    );
  }
}

class ContentBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final angleDelta = size.width * 0.05;
    final hDelta = size.height * 0.1;

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..color = AppColors.teal;
    Path path = Path();
//    uncomment this and will get the border for all lines
    path.lineTo(0.0, 0.0);
    path.lineTo(size.width - angleDelta, 0.0);
    path.lineTo(size.width, 0.0 + angleDelta);
    path.lineTo(size.width, size.height - hDelta);
    path.lineTo(size.width * 0.6, size.height - hDelta);
    path.lineTo(size.width * 0.6 - angleDelta, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    canvas.drawPath(path, paint);

    Paint paint_2 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..color = AppColors.teal;
    Path path_2 = Path();

    final indent = hDelta * 0.3;

    final secondHeight = size.height - hDelta + indent;

    final bigA = size.width - (size.width * 0.6 - angleDelta) - indent;
    final bigB = size.width - ((size.width - indent) * 0.6) - indent;

    final smallA = bigA;
    final smallB = bigB;

    final coorSmalA = size.width - smallA;
    final coorSmallB = size.width - smallB;

    path_2.moveTo(size.width, size.height);
    path_2.lineTo(coorSmalA, size.height);

    path_2.lineTo(coorSmallB, secondHeight);

    path_2.lineTo(size.width, secondHeight);
    path_2.close();
    canvas.drawPath(path_2, paint_2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
