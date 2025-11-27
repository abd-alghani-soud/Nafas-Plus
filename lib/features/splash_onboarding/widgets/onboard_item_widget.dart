import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardItem extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final int index;
  final ValueListenable<int> pageIndexListenable;

  const OnboardItem({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.index,
    required this.pageIndexListenable,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight,
          child: Column(

            children: [
              SizedBox(height: 35,),
              Expanded(
                child: Stack(
                  fit: StackFit.loose,
                  children: [
                    Image.asset(image, fit: BoxFit.cover),
                    Container(color: Colors.black.withOpacity(0.25)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
                child: ValueListenableBuilder<int>(
                  valueListenable: pageIndexListenable,
                  builder: (context, pageValue, _) {
                    final isActive = pageValue == index;
                    final double target = isActive ? 1.0 : 0.0;
                    return TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0.0, end: target),
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOut,
                      builder: (context, value, child) {
                        return Transform.translate(
                          offset: Offset(0, (1 - value) * 12),
                          child: Opacity(
                            opacity: 0.5 + 0.5 * value,
                            child: child,
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(22.r),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              vertical: 20.h,
                              horizontal: 18.w,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(22.r),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.18),
                                width: 1.0,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  subTitle,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.white.withOpacity(0.92),
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
