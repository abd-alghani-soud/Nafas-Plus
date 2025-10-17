import 'package:flutter/material.dart';
import 'package:nafas/core/constants/my_images.dart';
import '../core/constants/my_colors.dart';

class CustomBackground extends StatelessWidget {
  final Widget widget;
  final AppBar? appBar;

  const CustomBackground({super.key, required this.widget, this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar,
      backgroundColor: MyColors.backgroundDark2,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
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
      ),
    );
  }
}
