import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoProfile extends StatelessWidget {
  const InfoProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 24.r,
          backgroundImage: AssetImage('assets/images/a.jpg'),
        ),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ahmad Amaya",
              style: TextStyle(color: Colors.white, fontSize: 22.sp),
            ),
            Row(
              children: [
                Icon(Icons.phone, color: Colors.grey, size: 16.sp),
                SizedBox(width: 6.w),
                Text(
                  "0912345678",
                  style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
