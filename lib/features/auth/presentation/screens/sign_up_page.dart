import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nafas/core/constants/my_colors.dart';
import 'package:nafas/core/constants/my_string.dart';
import 'package:nafas/features/auth/presentation/screens/complete_information_page.dart';
import 'package:nafas/features/auth/presentation/widgets/custom_button.dart';
import 'package:nafas/features/auth/presentation/widgets/custom_text_field.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userController = TextEditingController();

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
              child: Image(
                image: AssetImage('assets/images/image1.png'),
                width: 200,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Image(
                image: AssetImage('assets/images/image.png'),
                width: 200,
              ),
            ),
            SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 12,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 160.h),
                      Text(
                        MyString.createAccount,
                        style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 0,
                        ),
                        child: Text(
                          MyString.titleSignUp2,
                          style: TextStyle(
                            color: MyColors.grayAccent,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 0,
                        ),
                        child: Text(
                          MyString.titleSignUp,
                          style: TextStyle(
                            color: MyColors.grayAccent,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 50.h),
                      CustomTextField(
                        controller: userController,
                        hint: MyString.hintName,
                        fillColor: MyColors.backgroundDark2,
                      ),
                      SizedBox(height: 20.h),
                      CustomTextField(
                        hint: MyString.hintEmail,
                        controller: emailController,
                        isEmailField: true,
                        fillColor: MyColors.backgroundDark2,
                      ),
                      SizedBox(height: 20.h),
                      CustomTextField(
                        hint: MyString.hintPassword,
                        controller: emailController,
                        isPasswordField: true,
                        fillColor: MyColors.backgroundDark2,
                      ),
                      SizedBox(height: 25.h),
                      CustomButton(
                        text: "Sign up",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CompleteInformationPage(),
                            ),
                          );
                          print("Sign up!!!!!!!!!!");
                        },
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            MyString.alreadyHaveAnAccount,
                            style: TextStyle(fontSize: 15.sp),
                          ),
                          SizedBox(width: 8.w),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Text(
                              MyString.signIn,
                              style: TextStyle(
                                fontSize: 17.sp,
                                decorationColor: MyColors.greenAccent,
                                color: MyColors.greenAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
