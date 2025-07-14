import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nafas/constant/my_icons.dart';
import 'package:nafas/constant/my_string.dart';
import 'package:nafas/custom_background.dart';
import 'package:nafas/features/profile/presentation/widgets/info_Profile.dart';
import 'package:nafas/features/profile/presentation/widgets/logout_button.dart';

import '../widgets/custom_profile_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      widget: Padding(
        padding: EdgeInsets.only(left: 24.w, top: 60.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoProfile(),
            SizedBox(height: 80.h),
            CustomProfileButton(
              name: MyString.myProfile,
              iconName: MyIcons.profile,
            ),
            CustomProfileButton(
              name: MyString.records,
              iconName: MyIcons.records,
            ),
            CustomProfileButton(
              name: MyString.privacy,
              iconName: MyIcons.privacy,
            ),
            CustomProfileButton(
              name: MyString.help,
              iconName: MyIcons.helpCenter,
            ),
            CustomProfileButton(
              name: MyString.settings,
              iconName: MyIcons.setting,
            ),
            Spacer(),
            LogoutButton(),
            SizedBox(height: 40.h,),
          ],
        ),
      ),
    );
  }
}
