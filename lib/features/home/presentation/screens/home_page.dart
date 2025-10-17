import 'package:flutter/material.dart';
import 'package:nafas/core/constants/my_colors.dart';
import 'package:nafas/core/constants/my_images.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundDark2,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset(MyImages.kLogo)],
      ),
    );
  }
}
