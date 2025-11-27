import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nafas/core/constants/my_colors.dart';
import 'package:nafas/core/constants/my_string.dart';
import 'package:nafas/features/auth/presentation/screens/sign_up_page.dart';
import 'package:nafas/features/auth/presentation/widgets/custom_button.dart';
import 'package:nafas/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:nafas/features/home/presentation/screens/first_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                      SizedBox(height: 150.h),
                      Text(
                        MyString.welcome,
                        style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 31.0,
                          vertical: 0,
                        ),
                        child: Text(
                          MyString.loginText,
                          style: TextStyle(
                            color: MyColors.grayAccent,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 50.h),
                      CustomTextField(
                        hint: MyString.hintEmail,
                        controller: emailController,
                        isEmailField: true,
                        fillColor: MyColors.backgroundDark2,
                      ),
                      SizedBox(height: 20.h),
                      CustomTextField(
                        hint: MyString.hintPassword,
                        controller: passwordController,
                        isPasswordField: true,
                        fillColor: MyColors.backgroundDark2,
                      ),
                      SizedBox(height: 40.h),
                      CustomButton(
                        text: "Login",
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FirstPage(),
                            ),
                            (Route<dynamic> route) => false,
                          );
                          print("Login!!!!!!!!!!");
                        },
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(fontSize: 15.sp),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpPage(),
                                ),
                              );
                            },
                            child: Text(
                              'sign up',
                              style: TextStyle(
                                fontSize: 17.sp,
                                color: MyColors.greenAccent,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
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
