import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nafas/features/home/presentation/widgets/bubble_icon_widget.dart';

class CustomBottomNav extends StatelessWidget {
  final ValueNotifier<int> selectedIndex;
  const CustomBottomNav({required this.selectedIndex, super.key});

  @override
  Widget build(BuildContext context) {
    final List<IconData> iconList = [
      FontAwesomeIcons.houseMedical,
      FontAwesomeIcons.alarmClock,
      FontAwesomeIcons.personRunning,
      Icons.person,
    ];
    final List<String> labels = [
      'الصحة',
      'المنبه',
      'رياضة',
      'البروفايل',
    ];
    final double bottomInset = MediaQuery.of(context).viewPadding.bottom;
    final double containerHeight = 80.h;

    return Padding(
      padding: EdgeInsets.only(left: 14.w, right: 14.w, bottom: bottomInset + 8.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 18.0, sigmaY: 18.0),
          child: Container(
            height: containerHeight,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.18),
              borderRadius: BorderRadius.circular(22.r),
              border: Border.all(color: Colors.white.withOpacity(0.06), width: 1),
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
                return Expanded(
                  child: GestureDetector(
                    onTap: () => selectedIndex.value = i,
                    behavior: HitTestBehavior.opaque,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: isSelected
                              ? BubbleIcon(icon: iconList[i], size: 60.h)
                              : Icon(iconList[i], size: 24.sp, color: Colors.white),
                        ),
                        SizedBox(height: isSelected ? 0 : 5.h),
                        if (!isSelected)
                          Flexible(
                            child: Text(
                              labels[i],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.sp,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
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
