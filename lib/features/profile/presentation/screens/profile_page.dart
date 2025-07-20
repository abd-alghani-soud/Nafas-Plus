import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nafas/constant/my_icons.dart';
import 'package:nafas/constant/my_images.dart';
import 'package:nafas/constant/my_string.dart';
import 'package:nafas/features/profile/presentation/screens/my_profile_page.dart';
import 'package:nafas/widgets/custom_background.dart';
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
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoProfile(),
                SizedBox(height: 80.h),
                CustomProfileButton(
                  name: MyString.myProfile,
                  iconName: MyIcons.profile,
                  page: MyProfilePage(),
                ),
                CustomProfileButton(
                  name: MyString.records,
                  iconName: MyIcons.records,
                  page: MyProfilePage(),
                ),
                CustomProfileButton(
                  name: MyString.privacy,
                  iconName: MyIcons.privacy,
                  page: MyProfilePage(),
                ),
                CustomProfileButton(
                  name: MyString.help,
                  iconName: MyIcons.helpCenter,
                  page: MyProfilePage(),
                ),
                CustomProfileButton(
                  name: MyString.settings,
                  iconName: MyIcons.setting,
                  page: MyProfilePage(),
                ),
                Spacer(),
                LogoutButton(),
                SizedBox(height: 40.h),
              ],
            ),
            Spacer(),
            Image(image: AssetImage(MyImages.pages)),
          ],
        ),
      ),
    );
  }
}
