import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/utils/colors.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 130,
      child: CustomPaint(
        painter: AvatarBorderPainter(),
        child: Container(),
      ),
    );
  }
}

class AvatarBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..color = AppColors.teal;
    Path path = Path();

    path.lineTo(0.0, 0.0);
    path.lineTo(size.width * 0.85, 0.0);
    path.lineTo(size.width, size.height * 0.15);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0.15, size.height);
    path.lineTo(0.0, size.height * 0.85);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
