import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nafas/features/alarm_clock/presentation/screens/alarm_clock_page.dart';
import 'package:nafas/features/home/presentation/screens/home_page.dart';
import 'package:nafas/features/home/presentation/widgets/custom_nav_bar.dart';
import 'package:nafas/features/profile/presentation/screens/profile_page.dart';
import 'package:nafas/features/sport/presentation/screens/sport_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final ValueNotifier<int> selectedIndex = ValueNotifier(0);

  @override
  void dispose() {
    selectedIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: selectedIndex,
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: const Color(0xFF010101),
          extendBody: true,
          body: Stack(
            children: [
              IndexedStack(
                index: value,
                children: const [
                  HomePage(),
                  AlarmClockPage(),
                  SportPage(),
                  ProfilePage(),
                ],
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: 220.h,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Color.fromARGB(40, 20, 20, 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: CustomBottomNav(
            selectedIndex: selectedIndex,
          ),
        );
      },
    );
  }
}
