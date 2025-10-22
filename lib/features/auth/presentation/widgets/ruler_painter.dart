import 'package:flutter/material.dart';

class RulerPainter extends CustomPainter {
  final double min;
  final double max;
  final double currentValue;
  final Color lineColor;
  final Color activeColor;
  final double figureHeight;

  RulerPainter({
    required this.min,
    required this.max,
    required this.currentValue,
    required this.lineColor,
    required this.activeColor,
    required this.figureHeight,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const double spacing = 1;
    final double range = max - min;
    final int lines = range ~/ spacing + 1;
    final double pxPerCm = figureHeight / range;

    for (int i = 0; i < lines; i++) {
      final double value = min + i * spacing;
      final double y = size.height - (i * pxPerCm);

      double lineLen = 10;
      TextStyle textStyle = TextStyle(color: lineColor, fontSize: 14);

      if (value % 25 == 0) {
        lineLen = 40;
        textStyle = TextStyle(
          color: activeColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        );
      } else if (value % 5 == 0) {
        lineLen = 25;
      }

      final bool active = value <= currentValue;
      final Paint p =
          Paint()
            ..color = active ? activeColor : lineColor
            ..strokeWidth = 2
            ..strokeCap = StrokeCap.round;

      canvas.drawLine(
        Offset(size.width - lineLen, y),
        Offset(size.width, y),
        p,
      );

      if (value % 25 == 0 || i == 0 || i == lines - 1) {
        final TextPainter tp = TextPainter(
          text: TextSpan(text: '${value.toInt()} cm', style: textStyle),
          textDirection: TextDirection.ltr,
        );
        tp.layout();
        tp.paint(
          canvas,
          Offset(size.width - lineLen - tp.width - 5, y - tp.height / 2),
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant RulerPainter oldDelegate) =>
      oldDelegate.currentValue != currentValue;
}
