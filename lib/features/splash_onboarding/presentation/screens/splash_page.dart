import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nafas/core/constants/my_images.dart';
import 'package:nafas/features/auth/presentation/screens/login_page.dart';
import '../../../../core/constants/my_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isFading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      setState(() {
        isFading = false;
      });
    });

    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundDark2,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                MyImages.circle1,
                fit: BoxFit.cover,
                width: 120.w,
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox.shrink();
                },
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Image.asset(
                MyImages.circle2,
                fit: BoxFit.cover,
                width: 120.w,
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox.shrink();
                },
              ),
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isFading
                      ? Image.asset(
                            MyImages.kLogo,
                            height: 350.h,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return SizedBox(
                                height: 120.h,
                                width: 120.h,
                                child: Icon(
                                  Icons.broken_image,
                                  size: 48.r,
                                  color: MyColors.greenNeon,
                                ),
                              );
                            },
                          )
                          .animate(
                            onPlay:
                                (controller) =>
                                    controller.repeat(reverse: true),
                          )
                          .fade(duration: 1.seconds)
                      : Image.asset(
                        MyImages.kLogo,
                        height: 350.h,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return SizedBox(
                            height: 120.h,
                            width: 120.h,
                            child: Icon(
                              Icons.broken_image,
                              size: 48.r,
                              color: MyColors.greenNeon,
                            ),
                          );
                        },
                      ),
                  SizedBox(height: 5.h),
                  isFading
                      ? Text(
                            'Nafas+',
                            style: GoogleFonts.aBeeZee(
                              fontSize: 44.sp,
                              fontWeight: FontWeight.bold,
                              color: MyColors.greenNeon,
                            ),
                          )
                          .animate(
                            onPlay:
                                (controller) =>
                                    controller.repeat(reverse: true),
                          )
                          .fade(duration: 1.seconds)
                      : Text(
                        'Nafas+',
                        style: GoogleFonts.aBeeZee(
                          fontSize: 44.sp,
                          fontWeight: FontWeight.bold,
                          color: MyColors.greenNeon,
                        ),
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
