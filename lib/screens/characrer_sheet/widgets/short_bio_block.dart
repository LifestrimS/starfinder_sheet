import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class ShortBioBlock extends StatefulWidget {
  const ShortBioBlock({super.key});

  @override
  State<ShortBioBlock> createState() => _ShortBioBlockState();
}

class _ShortBioBlockState extends State<ShortBioBlock> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.0,
      child: CustomPaint(
          painter: ShortBioBlockPainter(),
          child: const Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: const ShortBioRow(name: 'Name:', content: 'Chiara')),
                const SizedBox(
                  height: 4.0,
                ),
                Expanded(
                    child: const ShortBioRow(
                        name: 'Class:', content: 'Operative')),
                const SizedBox(
                  height: 4.0,
                ),
                Expanded(
                    child: const ShortBioRow(name: 'Race:', content: 'Elf')),
                const SizedBox(
                  height: 4.0,
                ),
                Expanded(child: const ShortBioAlignment()),
                const SizedBox(
                  height: 4.0,
                ),
                Expanded(child: const ShortBioSize()),
              ],
            ),
          )),
    );
  }
}

class ShortBioBlockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const cut = 0.1;

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..color = AppColors.teal;
    Path path = Path();

    path.moveTo(0.0, 0.0);
    path.lineTo(size.width * (1 - cut * 1.5), 0.0);
    path.moveTo(size.width, size.height * cut * 1.5);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * cut, size.height);
    path.lineTo(0.0, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class ShortBioRow extends StatelessWidget {
  final String name;
  final String content;

  const ShortBioRow({required this.name, required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    controller.text = content;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(name, style: AppStyles.commonPixel().copyWith(fontSize: 8.0)),
        Expanded(
          child: TextFormField(
            initialValue: content,
            expands: true,
            maxLines: null,
            style: AppStyles.commonPixel(),
            textAlign: TextAlign.right,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
            //onChanged: (value) => statValue.value = int.parse(value),
          ),
        ),
      ],
    );
  }
}

class ShortBioAlignment extends StatefulWidget {
  const ShortBioAlignment({super.key});

  @override
  State<ShortBioAlignment> createState() => _ShortBioAlignmentState();
}

class _ShortBioAlignmentState extends State<ShortBioAlignment> {
  final List<String> alignments = [
    'LG',
    'NG',
    'CG',
    'LN',
    'NN',
    'CN',
    'LE',
    'NE',
    'CE'
  ];
  String alignment = 'LG';
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Alignment',
            style: AppStyles.commonPixel().copyWith(fontSize: 8.0)),
        const Spacer(),
        Expanded(
          child: PopupMenuButton(
            padding: EdgeInsets.zero,
            menuPadding: EdgeInsets.zero,
            position: PopupMenuPosition.under,
            style: const ButtonStyle(alignment: Alignment.centerRight),
            color: AppColors.darkBlue,
            icon: Text(
              alignment,
              textAlign: TextAlign.end,
              style: AppStyles.commonPixel(),
            ),
            initialValue: alignment,
            itemBuilder: (BuildContext context) => alignments
                .map<PopupMenuItem<String>>(
                  (String alignments) => PopupMenuItem<String>(
                    value: alignments,
                    child: Text(
                      alignments,
                      textAlign: TextAlign.end,
                      style: AppStyles.commonPixel(),
                    ),
                  ),
                )
                .toList(),
            onSelected: (value) => setState(() {
              alignment = value;
            }),
          ),
        )
      ],
    );
  }
}

class ShortBioSize extends StatefulWidget {
  const ShortBioSize({super.key});

  @override
  State<ShortBioSize> createState() => _ShortBioSizeState();
}

class _ShortBioSizeState extends State<ShortBioSize> {
  final List<String> sizes = [
    'T',
    'S',
    'M',
    'L',
    'H',
    'G',
    'C',
  ];
  String size = 'M';
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Size', style: AppStyles.commonPixel().copyWith(fontSize: 8.0)),
        const Spacer(),
        Expanded(
          child: PopupMenuButton(
            padding: EdgeInsets.zero,
            menuPadding: EdgeInsets.zero,
            position: PopupMenuPosition.under,
            style: const ButtonStyle(alignment: Alignment.centerRight),
            color: AppColors.darkBlue,
            icon: Text(
              size,
              textAlign: TextAlign.end,
              style: AppStyles.commonPixel(),
            ),
            initialValue: size,
            itemBuilder: (BuildContext context) => sizes
                .map<PopupMenuItem<String>>(
                  (String sizes) => PopupMenuItem<String>(
                    value: sizes,
                    child: Text(
                      sizes,
                      textAlign: TextAlign.end,
                      style: AppStyles.commonPixel(),
                    ),
                  ),
                )
                .toList(),
            onSelected: (value) => setState(() {
              size = value;
            }),
          ),
        )
      ],
    );
  }
}
