

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../features/splash_onboarding/presentation/screens/onboarding.dart';

class CustomPageViewWidget extends StatelessWidget {
final OnBoardElement onBoardElement;
final int currentIndex;
final PageController pageController;

  const CustomPageViewWidget({super.key, required this.onBoardElement, required this.currentIndex, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Positioned(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 80,
            ),
            child: buildCircularImage(onBoardElement.image),
          ),
        ),
        Positioned(
          child: Column(
            children: [
              SizedBox(height: 500.h,
                width: 400.w,),
              Text(
                onBoardElement.title,
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50.h,
                width: 400.w,),
              Text(
                onBoardElement.subTitle,
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],
          ),
        ),
        Positioned(
          top: 720.h,
          right: 130.w,
          child: currentIndex != 2
              ? ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                    Colors.green),
              ),
              onPressed: () {
                pageController
                    .jumpToPage(3 - 1);
              },
              child: Text(
                ' Skip ',
                style: TextStyle(color: Colors.white),
              ))
              : SizedBox(),
        ),
      ],
    );
  }
  Widget buildCircularImage(String path) {
    return ClipOval(
      child: Image.asset(path, width: 330, height: 330, fit: BoxFit.cover),
    );
  }
}
