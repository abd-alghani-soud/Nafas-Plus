import 'package:flutter/material.dart';
import 'package:nafas/core/constants/my_colors.dart';
import 'package:nafas/core/constants/my_string.dart';
import 'package:nafas/features/auth/presentation/screens/step1_personal_info_page.dart';
import 'package:nafas/features/home/presentation/screens/first_page.dart';
import 'package:get/get.dart';

// استيراد الملفات الجديدة
import 'package:nafas/features/auth/presentation/screens/step2_physical_info.dart';

class CompleteInfoPage extends StatefulWidget {
  const CompleteInfoPage({super.key});

  @override
  State<CompleteInfoPage> createState() => _CompleteInfoPageState();
}

class _CompleteInfoPageState extends State<CompleteInfoPage> {
  String _firstName = '';
  bool _isMale = true;
  double _height = 170;
  int _weight = 65;
  int _age = 25;

  // حالة الخطوة الحالية: 1 أو 2
  int _currentStep = 1;

  void _onStep1Next(String firstName, bool isMale) {
    setState(() {
      _firstName = firstName;
      _isMale = isMale;
      _currentStep = 2; // الانتقال للخطوة الثانية
    });
  }

  void _onStep2Back() {
    setState(() {
      _currentStep = 1; // العودة للخطوة الأولى
    });
  }

  void _onFinish(double height, int weight, int age) {
    setState(() {
      _height = height;
      _weight = weight;
      _age = age;
    });

    // منطق الإكمال النهائي
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Complete Information: $_firstName, ${_isMale ? "Male" : "Female"}, ${_height.toInt()} cm, $_weight kg, $_age yrs',
        ),
        duration: const Duration(seconds: 3),
      ),
    );

    print(
      'Final Data -> firstName: $_firstName, isMale: $_isMale, height: ${_height.toInt()}, weight: $_weight, age: $_age',
    );

    // الانتقال للصفحة الرئيسية
    Get.offAll(
      () => const FirstPage(),
      transition: Transition.fade,
      duration: MyString.kDuration,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundDark2,
      appBar: AppBar(
        // عرض زر الرجوع فقط في الخطوة الثانية
        leading:
            _currentStep == 2
                ? IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: MyColors.white),
                  onPressed: _onStep2Back,
                )
                : null,
        elevation: 2,
        backgroundColor: MyColors.backgroundDark2,
        centerTitle: true,
        title: Text(
          _currentStep == 1 ? 'Personal Information' : 'Physical Attributes',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          // لإضافة حيوية في الانتقال
          child:
              _currentStep == 1
                  ? Step1PersonalInfo(
                    key: const ValueKey(
                      'step1',
                    ), // مفتاح لتفعيل الـ AnimatedSwitcher
                    onNext: _onStep1Next,
                    initialFirstName: _firstName,
                    initialIsMale: _isMale,
                  )
                  : Step2PhysicalInfo(
                    key: const ValueKey('step2'),
                    // مفتاح لتفعيل الـ AnimatedSwitcher
                    onFinish: _onFinish,
                    onBack: _onStep2Back,
                    initialHeight: _height,
                    initialWeight: _weight,
                    initialAge: _age,
                  ),
        ),
      ),
    );
  }
}
