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
    required this.page,
  });

  final String name;
  final String iconName;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: SizedBox(
        width: 212.w,
        height: 61.h,
        child: Row(
          children: [
            SizedBox(width: 8.w),
            SvgPicture.asset(iconName, width: 26, height: 26),
            SizedBox(width: 20.w),
            Expanded(
              flex: 999,
              child: AutoSizeText(
                name,
                style: TextStyle(fontSize: 20.sp, color: Colors.white),
                maxLines: 1,
                minFontSize: 15,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Spacer(),
            Icon(
              CupertinoIcons.right_chevron,
              size: 26.sp,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
