import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nafas/core/constants/my_colors.dart';
import 'package:nafas/features/auth/presentation/screens/login_page.dart';
import 'package:nafas/features/auth/presentation/widgets/custom_button.dart';
import 'package:nafas/features/splash_onboarding/widgets/onboard_item_widget.dart';

final PageController onboardingPageController = PageController();
final ValueNotifier<int> onboardingPageIndex = ValueNotifier<int>(0);

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  // pages data (english as requested)
  static final List<Map<String, String>> pages = [
    {
      "image": 'assets/images/a.jpg',
      "title": "Welcome!",
      "sub": "Your smart medical app to manage appointments easily.",
    },
    {
      "image": 'assets/images/a.jpg',
      "title": "Top Doctors",
      "sub": "Discover and follow doctors with ease.",
    },
    {
      "image": 'assets/images/a.jpg',
      "title": "Book Now",
      "sub": "Book your appointment with one tap.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Scaffold(
        backgroundColor: MyColors.backgroundDark2,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: onboardingPageController,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (index) => onboardingPageIndex.value = index,
                  itemCount: pages.length,
                  itemBuilder: (context, index) {
                    final page = pages[index];
                    return OnboardItem(
                      image: page['image']!,
                      title: page['title']!,
                      subTitle: page['sub']!,
                      index: index,
                      pageIndexListenable: onboardingPageIndex,
                    );
                  },
                ),
              ),
              SizedBox(height: 20.h),
              ValueListenableBuilder<int>(
                valueListenable: onboardingPageIndex,
                builder: (_, value, __) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      pages.length,
                      (i) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        height: 8.h,
                        width: value == i ? 28.w : 10.w,
                        decoration: BoxDecoration(
                          color:
                              value == i
                                  ? MyColors.greenAccent
                                  : MyColors.greenNeon.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 25.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ValueListenableBuilder<int>(
                  valueListenable: onboardingPageIndex,
                  builder: (_, value, __) {
                    final isLast = value == pages.length - 1;
                    return isLast
                        ? CustomButton(
                          text: 'Start Now',
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                              (Route<dynamic> route) => false,
                            );
                          },
                        )
                        : Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                onboardingPageController.jumpToPage(
                                  pages.length - 1,
                                );
                                onboardingPageIndex.value = pages.length - 1;
                              },
                              child: Text(
                                "Skip",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: MyColors.greenAccent,
                                ),
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              height: 60,
                              child: ElevatedButton(
                                onPressed: () {
                                  final next = (value + 1).clamp(
                                    0,
                                    pages.length,
                                  );
                                  onboardingPageController.nextPage(
                                    duration: const Duration(milliseconds: 450),
                                    curve: Curves.easeOutCubic,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: MyColors.greenAccent,
                                  foregroundColor: Colors.white,
                                  minimumSize: Size(60.w, 50.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                ),
                              ),
                            ),
                          ],
                        );
                  },
                ),
              ),

              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
