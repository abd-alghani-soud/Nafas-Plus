import 'package:flutter/material.dart';
import 'package:nafas/core/constants/my_colors.dart';

import 'human_silhouette.dart';
import 'ruler_painter.dart';
import 'height_indicator.dart';

class HeightRulerPicker extends StatefulWidget {
  final double initialHeight;
  final ValueChanged<double> onChanged;

  final double minHeight;
  final double maxHeight;
  final bool animated;

  const HeightRulerPicker({
    super.key,
    required this.initialHeight,
    required this.onChanged,
    this.minHeight = 100,
    this.maxHeight = 220,
    this.animated = true,
  });

  @override
  State<HeightRulerPicker> createState() => _HeightRulerPickerState();
}

class _HeightRulerPickerState extends State<HeightRulerPicker> {
  late double _currentHeight;
  final double _figureAreaHeight = 350.0;
  final double _rulerPaddingBottom = 50.0;

  @override
  void initState() {
    super.initState();
    _currentHeight = widget.initialHeight.clamp(
      widget.minHeight,
      widget.maxHeight,
    );
  }

  void _updateHeightFromDrag(
    DragUpdateDetails details,
    double containerHeight,
  ) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final local = renderBox.globalToLocal(details.globalPosition);

    double newYFromBottom = (containerHeight + _rulerPaddingBottom) - local.dy;
    newYFromBottom = newYFromBottom.clamp(0.0, containerHeight);

    double heightPercentage = newYFromBottom / containerHeight;

    final double range = widget.maxHeight - widget.minHeight;
    double newHeight = widget.minHeight + (heightPercentage * range);

    setState(() {
      _currentHeight = newHeight.roundToDouble().clamp(
        widget.minHeight,
        widget.maxHeight,
      );
      widget.onChanged(_currentHeight);
    });
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    _updateHeightFromDrag(details, _figureAreaHeight);
  }

  @override
  Widget build(BuildContext context) {
    final double range = widget.maxHeight - widget.minHeight;
    double heightPercent = (_currentHeight - widget.minHeight) / range;
    heightPercent = heightPercent.clamp(0.0, 1.0);

    const double minScale = 0.30;
    const double maxScale = 1.0;
    final double scale = minScale + (maxScale - minScale) * heightPercent;
    final double iconHeight = _figureAreaHeight * scale;
    final double iconWidth = iconHeight * 0.48;
    final double indicatorY = heightPercent * iconHeight;
    Widget human = HumanSilhouette(
      width: iconWidth,
      height: iconHeight,
      color: MyColors.white,
      legGapFactor: 0.08,
    );
    if (widget.animated) {
      human = AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        height: iconHeight,
        width: iconWidth,
        child: human,
      );
    } else {
      human = SizedBox(height: iconHeight, width: iconWidth, child: human);
    }

    return Column(
      children: [
        const Text(
          'How tall are you?',
          style: TextStyle(
            color: MyColors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onVerticalDragUpdate: _onVerticalDragUpdate,
          child: SizedBox(
            height: _figureAreaHeight + _rulerPaddingBottom,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(bottom: _rulerPaddingBottom, child: human),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 50,
                    height: _figureAreaHeight,
                    alignment: Alignment.centerRight,
                    child: CustomPaint(
                      size: Size(50, _figureAreaHeight),
                      painter: RulerPainter(
                        min: widget.minHeight,
                        max: widget.maxHeight,
                        currentValue: _currentHeight,
                        lineColor: MyColors.white.withOpacity(0.5),
                        activeColor: MyColors.greenAccent,
                        figureHeight: _figureAreaHeight,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: indicatorY + _rulerPaddingBottom,
                  left: 0,
                  right: 0,
                  child: HeightIndicator(
                    value: _currentHeight,
                    color: MyColors.greenAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
