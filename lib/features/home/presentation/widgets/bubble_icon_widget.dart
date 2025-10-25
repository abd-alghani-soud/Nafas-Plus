import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BubbleIcon extends StatelessWidget {
  final IconData icon;
  final double size;

  const BubbleIcon({required this.icon, required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF4cb050),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF4cb050).withOpacity(0.5),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Center(
              child: Transform.translate(
                offset: const Offset(0, 0),
                child: Icon(icon, size: (size * 0.48).sp, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
