import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nafas/core/constants/my_icons.dart';
import 'package:nafas/core/constants/my_images.dart';
import 'package:nafas/core/constants/my_string.dart';
import 'package:nafas/features/auth/presentation/screens/login_page.dart';
import 'package:nafas/core/widgets/custom_background.dart';
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
                  page: LoginPage(),
                ),
                CustomProfileButton(
                  name: MyString.records,
                  iconName: MyIcons.records,
                  page: LoginPage(),
                ),
                CustomProfileButton(
                  name: MyString.privacy,
                  iconName: MyIcons.privacy,
                  page: LoginPage(),
                ),
                CustomProfileButton(
                  name: MyString.help,
                  iconName: MyIcons.helpCenter,
                  page: LoginPage(),
                ),
                CustomProfileButton(
                  name: MyString.settings,
                  iconName: MyIcons.setting,
                  page: LoginPage(),
                ),
                Spacer(),
                LogoutButton(),
                SizedBox(height: 40.h),
              ],
            ),
            Spacer(),
            Image(
              width: MediaQuery.of(context).size.width*0.2,
              height: MediaQuery.of(context).size.height,
              image: AssetImage(MyImages.p1),
            ),
          ],
        ),
      ),
    );
  }
}
