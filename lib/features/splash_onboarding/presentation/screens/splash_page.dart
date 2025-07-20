import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constant/my_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

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
    child: Image(image: AssetImage('assets/images/image1.png')),
    ),
    Positioned(
    right: 0,
    bottom: 0,
    child: Image(image: AssetImage('assets/images/image.png')),
    ),
    SingleChildScrollView(
    child: SafeArea(
    child: Padding(
    padding: const EdgeInsets.symmetric(
    horizontal: 240,
    vertical: 12,
    ),
    ),
    ),
    ),
      Center(
        child: Positioned(
            child:SvgPicture.asset('assets/images/Frame.svg',
            color: MyColors.greenNeon,

            height: 90.h,),
        ),
      ),
      Positioned(
           top: 450,
          left: 150,
          child:Text('Nafas',
          style: GoogleFonts.aBeeZee(
            fontSize: 30.h,
            fontWeight: FontWeight.bold,
            color:MyColors.greenNeon,
          ),)
      ),
       ] ),
    ),
    );

  }
}
