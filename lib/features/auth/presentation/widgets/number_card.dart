import 'package:flutter/material.dart';
import 'package:nafas/core/constants/my_colors.dart';

class NumberCard extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback onMinus;
  final VoidCallback onPlus;

  const NumberCard({
    super.key,
    required this.title,
    required this.value,
    required this.onMinus,
    required this.onPlus,
  });

  Widget _smallActionButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: MyColors.greenAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Icon(icon, color: Colors.black, size: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: MyColors.backgroundDark2,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: MyColors.greenAccent),
      ),
      child: Column(
        children: [
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(height: 6),
          Expanded(
            child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(value, style: const TextStyle(color: Colors.white, fontSize: 28)),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _smallActionButton(Icons.remove, onMinus),
              const SizedBox(width: 16),
              _smallActionButton(Icons.add, onPlus),
            ],
          ),
        ],
      ),
    );
  }
}
