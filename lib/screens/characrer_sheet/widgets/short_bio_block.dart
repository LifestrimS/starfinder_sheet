import 'package:flutter/material.dart';
import 'package:pathfinder_sheet/models.dart/character.dart';
import 'package:pathfinder_sheet/utils/colors.dart';
import 'package:pathfinder_sheet/utils/styles.dart';

class ShortBioBlock extends StatefulWidget {
  final Character character;

  const ShortBioBlock({required this.character, super.key});

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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: ShortBioRow(
                        name: 'Name:', content: widget.character.charName)),
                const SizedBox(
                  height: 4.0,
                ),
                Expanded(
                    child: ShortBioRow(
                        name: 'Class:', content: widget.character.charClass)),
                const SizedBox(
                  height: 4.0,
                ),
                Expanded(
                    child: ShortBioRow(
                        name: 'Race:', content: widget.character.race)),
                const SizedBox(
                  height: 4.0,
                ),
                Expanded(
                    child: ShortBioAlignment(
                  initialValue: widget.character.alignment.alignName,
                )),
                const SizedBox(
                  height: 4.0,
                ),
                Expanded(
                    child: ShortBioSize(
                  initialValue: widget.character.size.sizeName,
                )),
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
  final String initialValue;
  const ShortBioAlignment({required this.initialValue, super.key});

  @override
  State<ShortBioAlignment> createState() => _ShortBioAlignmentState();
}

class _ShortBioAlignmentState extends State<ShortBioAlignment> {
  String alignment = '';

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
              alignment == '' ? widget.initialValue : alignment,
              textAlign: TextAlign.end,
              style: AppStyles.commonPixel(),
            ),
            initialValue: widget.initialValue,
            itemBuilder: (BuildContext context) => CharAlignment.values
                .map<PopupMenuItem<String>>(
                  (CharAlignment alignment) => PopupMenuItem<String>(
                    value: alignment.alignName,
                    child: Text(
                      alignment.alignName,
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
  final String initialValue;

  const ShortBioSize({required this.initialValue, super.key});

  @override
  State<ShortBioSize> createState() => _ShortBioSizeState();
}

class _ShortBioSizeState extends State<ShortBioSize> {
  String size = '';
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
              size == '' ? widget.initialValue : size,
              textAlign: TextAlign.end,
              style: AppStyles.commonPixel(),
            ),
            initialValue: widget.initialValue,
            itemBuilder: (BuildContext context) => CharSize.values
                .map<PopupMenuItem<String>>(
                  (CharSize size) => PopupMenuItem<String>(
                    value: size.sizeName,
                    child: Text(
                      size.sizeName,
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
