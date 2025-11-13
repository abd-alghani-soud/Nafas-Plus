import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/widgets/custom_background.dart';
import '../../../../widgets/custom_page_view_widget.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  List<OnBoardElement> boardPage = [
    OnBoardElement(title: 'dckhv,cgjxs', subTitle:  'idtgftie6tfgj', image:'assets/images/1.jpg',),
    OnBoardElement(title: 'dckhv,cgjxs', subTitle:  'idtgftie6tfgj', image:'assets/images/2.jpg',),
    OnBoardElement(title: 'dckhv,cgjxs', subTitle:  'idtgftie6tfgj', image:'assets/images/3.jpg',),
    // {
    //   'image': 'assets/images/1.jpg',
    //   'title':,
    //   'subTitle': 'idtgftie6tfgj',
    // },
    // {
    //   'image': 'assets/images/2.jpg',
    //   'title': 'diykfhvbm',
    //   'subTitle': 'sujtdgcvnb',
    // },
    // {
    //   'image': 'assets/images/3.jpg',
    //   'title': 'iyfkhbmflhb,',
    //   'subTitle': 'khyvn easdzxc',
    // },
  ];
  int currentIndex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      widget: Expanded(
        child: PageView.builder(
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          controller: pageController,
          itemCount: boardPage.length,
          itemBuilder: (context, index) {
            return CustomPageViewWidget(onBoardElement:boardPage[index], currentIndex: currentIndex , pageController: pageController,);
          },
        ),
      ),
    );
  }


}


class  OnBoardElement{


  final String title;
  final String subTitle;
  final String image;

  OnBoardElement({required this.title, required this.subTitle, required this.image});

}

