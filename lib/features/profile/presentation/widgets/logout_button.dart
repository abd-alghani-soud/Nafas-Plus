import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/my_icons.dart';
import '../../../../core/constants/my_string.dart';


class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

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
            SvgPicture.asset(MyIcons.logout,width: 30,height: 30,),
            SizedBox(width: 20.w),
            Text(
              MyString.logout,
              style: TextStyle(fontSize: 28.sp, color: Color(0xffff0000)),
            ),
            SizedBox(width: 12.w),
          ],
        ),
      ),
    );
  }
}
