import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constant/my_images.dart';
import 'package:nafas/features/profile/presentation/screens/profile_page.dart';

import '../../../../core/constants/my_images.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text('الصحة', style: TextStyle(fontSize: 20))),
    Center(child: Text('المنبه', style: TextStyle(fontSize: 20))),
    Center(child: Text('الرياضة', style: TextStyle(fontSize: 20))),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              MyImages.kLogo,
              width: 400.w,
              height: 500.h,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 30.h),
            _pages[_currentIndex],
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (home) {
          setState(() {
            _currentIndex = home;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الصحة'),
          BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'المنبه'),
          BottomNavigationBarItem(icon: Icon(Icons.sports_baseball_rounded), label: 'رياضة'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'بروفايل'),
        ],
      ),
    );
  }
}
