import 'package:flutter/material.dart';
import 'package:nafas/features/auth/presentation/widgets/human_painter.dart';

class HumanSilhouette extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double legGapFactor;

  const HumanSilhouette({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    this.legGapFactor = 0.12,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: HumanPainter(fillColor: color, legGapFactor: legGapFactor),
    );
  }
}
