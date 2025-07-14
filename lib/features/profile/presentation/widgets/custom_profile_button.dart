import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomProfileButton extends StatelessWidget {
  const CustomProfileButton({
    super.key,
    required this.name,
    required this.iconName,
  });

  final String name;
  final String iconName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {},
      child: SizedBox(
        width: 212.w,
        height: 61.h,
        child: Row(
          children: [
            SizedBox(width: 12.w),
            SvgPicture.asset(iconName,width: 22,height: 22,),
            SizedBox(width: 20.w),
            Expanded(
              flex: 999,
              child: AutoSizeText(
                name,
                style: TextStyle(fontSize: 20.sp, color: Colors.white),
                maxLines: 1,
                minFontSize: 17,
              ),
            ),
            Spacer(),
            Icon(
              CupertinoIcons.right_chevron,
              size: 26.sp,
              color: Colors.white,
            ),
            SizedBox(width: 12.w),
          ],
        ),
      ),
    );
  }
}
