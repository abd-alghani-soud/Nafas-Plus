import 'package:flutter/material.dart';
import 'package:nafas/constant/my_images.dart';
import '../constant/my_colors.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundDark2,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image(image: AssetImage(MyImages.circle1)),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Image(image: AssetImage(MyImages.circle2)),
          ),
          widget,
        ],
      ),
    );
  }
}
