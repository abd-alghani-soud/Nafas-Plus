import 'package:flutter/material.dart';
import 'package:nafas/core/constants/my_colors.dart';

class HeightCard extends StatelessWidget {
  final double height;
  final ValueChanged<double> onChanged;

  const HeightCard({super.key, required this.height, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: MyColors.backgroundDark2,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: MyColors.greenAccent),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Height', style: TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(height: 8),
          Text('${height.toInt()} cm', style: const TextStyle(color: Colors.white, fontSize: 28)),
          const SizedBox(height: 8),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: MyColors.greenAccent,
              inactiveTrackColor: MyColors.backgroundDark2,
              thumbColor: MyColors.greenAccent,
              overlayColor: MyColors.greenAccent.withOpacity(0.1),
            ),
            child: Slider(
              value: height,
              min: 50,
              max: 300,
              divisions: 250,
              label: '${height.toInt()}',
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
