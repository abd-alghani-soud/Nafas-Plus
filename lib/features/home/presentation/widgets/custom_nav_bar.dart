import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nafas/core/constants/my_colors.dart';

class CustomBottomNav extends StatelessWidget {
  final ValueNotifier<int> selectedIndex;

  CustomBottomNav({required this.selectedIndex, super.key});

  final List<IconData> iconList = [
    FontAwesomeIcons.houseMedical,
    FontAwesomeIcons.clock,
    FontAwesomeIcons.personRunning,
    Icons.person,
  ];
  final List<String> labels = ['الصحة', 'المنبه', 'رياضة', 'البروفايل'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 14.w,
        right: 14.w,
        bottom: MediaQuery.of(context).viewPadding.bottom + 8.h,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 18.0, sigmaY: 18.0),
          child: Container(
            height: 80.h,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.18),
              borderRadius: BorderRadius.circular(22.r),
              border: Border.all(
                color: Colors.white.withOpacity(0.06),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.35),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(iconList.length, (i) {
                final bool isSelected = i == selectedIndex.value;
                final Color currentColor =
                    isSelected ? MyColors.greenAccent : Colors.white;

                return Expanded(
                  child: GestureDetector(
                    onTap: () => selectedIndex.value = i,
                    behavior: HitTestBehavior.opaque,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(iconList[i], size: 24.sp, color: currentColor),
                        SizedBox(height: 6.h),
                        Text(
                          labels[i],
                          style: TextStyle(
                            color: currentColor,
                            fontSize: 13.sp,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
