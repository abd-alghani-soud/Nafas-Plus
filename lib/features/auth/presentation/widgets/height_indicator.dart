import 'package:flutter/material.dart';
import 'package:nafas/core/constants/my_colors.dart';

class HeightIndicator extends StatelessWidget {
  final double value;
  final Color color;

  const HeightIndicator({super.key, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // بطاقة النص (قيمة الطول)
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '${value.toInt()} cm',
            style: const TextStyle(
              color: MyColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),

        // نفصل المساحة بين القيمة والعناصر على اليمين
        const Spacer(),

        // الخط الأخضر القصير على طرف اليمين (عرض 2px، ارتفاع ممكن تعدّله)
        Container(
          width: 2,
          height: 24,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),

        const SizedBox(width: 8),

        // الدائرة الصغيرة
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            border: Border.all(color: MyColors.white, width: 2),
          ),
        ),
      ],
    );
  }
}
