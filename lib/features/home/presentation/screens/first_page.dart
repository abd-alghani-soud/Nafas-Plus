import 'package:flutter/material.dart';
import 'package:nafas/features/alarm_clock/presentation/screens/alarm_clock_page.dart';
import 'package:nafas/features/home/presentation/screens/home_page.dart';
import 'package:nafas/features/profile/presentation/screens/profile_page.dart';
import 'package:nafas/features/sport/presentation/screens/sport_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  ValueNotifier<int> selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedIndex,
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          extendBody: true,
          body: IndexedStack(
            index: value,
            children: [
              HomePage(),
              AlarmClockPage(),
              SportPage(),
              ProfilePage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex.value,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (value) {
              selectedIndex.value = value;
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الصحة'),
              BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'المنبه'),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports_baseball_rounded),
                label: 'رياضة',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'بروفايل',
              ),
            ],
          ),
        );
      },
    );
  }
}
