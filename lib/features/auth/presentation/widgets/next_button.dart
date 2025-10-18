import 'package:flutter/material.dart';
import 'package:nafas/core/constants/my_colors.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const NextButton({super.key, required this.onTap, this.text = 'NEXT'});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          color: MyColors.greenAccent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
