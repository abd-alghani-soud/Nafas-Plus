import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:nafas/features/auth/presentation/screens/login_page.dart';

import '../../../../constant/my_colors.dart';

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
              child: Image.asset('assets/images/image1.png'),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Image.asset('assets/images/image.png'),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child:
                      isFading
                          ? SvgPicture.asset(
                                'assets/images/Frame.svg',
                                height: 110.h,
                                color: MyColors.greenNeon,
                              )
                              .animate(
                                onPlay:
                                    (controller) =>
                                        controller.repeat(reverse: true),
                              )
                              .fade(duration: 1.seconds)
                          : SvgPicture.asset(
                            'assets/images/Frame.svg',
                            height: 110.h,
                            color: MyColors.greenNeon,
                          ),
                ),
                SizedBox(height: 25.h),
                isFading
                    ? Text(
                          'Nafas+',
                          style: GoogleFonts.aBeeZee(
                            fontSize: 30.h,
                            fontWeight: FontWeight.bold,
                            color: MyColors.greenNeon,
                          ),
                        )
                        .animate(
                          onPlay:
                              (controller) => controller.repeat(reverse: true),
                        )
                        .fade(duration: 1.seconds)
                    : Text(
                      'Nafas+',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 30.h,
                        fontWeight: FontWeight.bold,
                        color: MyColors.greenNeon,
                      ),
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
