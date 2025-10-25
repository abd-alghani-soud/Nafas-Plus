// import 'package:flutter/material.dart';
// import 'package:nafas/core/constants/my_colors.dart';
// import 'package:nafas/core/constants/my_string.dart';
// import 'package:nafas/features/auth/presentation/widgets/custom_text_field.dart';
// import 'package:nafas/features/auth/presentation/widgets/gender_card.dart';
// import 'package:nafas/features/auth/presentation/widgets/height_card.dart';
// import 'package:nafas/features/auth/presentation/widgets/number_card.dart';
// import 'package:nafas/features/auth/presentation/widgets/next_button.dart';
// import 'package:nafas/features/home/presentation/screens/first_page.dart';
// import 'package:get/get.dart';
//
// class CompleteInformationPage extends StatefulWidget {
//   const CompleteInformationPage({super.key});
//
//   @override
//   State<CompleteInformationPage> createState() => _CompleteInformationPageState();
// }
//
// class _CompleteInformationPageState extends State<CompleteInformationPage> {
//   final TextEditingController firstNameController = TextEditingController();
//   bool isMale = true;
//   double height = 170;
//   int weight = 65;
//   int age = 25;
//
//   @override
//   void dispose() {
//     firstNameController.dispose();
//     super.dispose();
//   }
//
//   void _changeWeight(int delta) {
//     setState(() {
//       weight = (weight + delta).clamp(1, 500);
//     });
//   }
//
//   void _changeAge(int delta) {
//     setState(() {
//       age = (age + delta).clamp(1, 150);
//     });
//   }
//
//   void _onNextPressed() {
//     final name = firstNameController.text.trim();
//     if (name.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please enter the first name')),
//       );
//       return;
//     }
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(
//           'Captured: $name, ${isMale ? "Male" : "Female"}, ${height.toInt()} cm, $weight kg, $age yrs',
//         ),
//       ),
//     );
//     print(
//       'UI-only data -> firstName: $name, isMale: $isMale, height: ${height.toInt()}, weight: $weight, age: $age',
//     );
//     Get.offAll(FirstPage(), transition: Transition.fade,duration: MyString.kDuration);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: MyColors.backgroundDark2,
//       appBar: AppBar(
//         elevation: 2,
//         backgroundColor: MyColors.backgroundDark2,
//         centerTitle: true,
//         title: const Text(
//           'Complete Information',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 50),
//                 CustomTextField(
//                   controller: firstNameController,
//                   label: 'First Name',
//                   hint: 'Enter your first name',
//                   isEmailField: false,
//                   isPasswordField: false,
//                   isSearchField: false,
//                   fillColor: MyColors.backgroundDark2,
//                 ),
//                 const SizedBox(height: 28),
//                 Row(
//                   children: [
//                     GenderCard(
//                       icon: Icons.male,
//                       label: 'Male',
//                       active: isMale,
//                       onTap: () => setState(() => isMale = true),
//                     ),
//                     const SizedBox(width: 10),
//                     GenderCard(
//                       icon: Icons.female,
//                       label: 'Female',
//                       active: !isMale,
//                       onTap: () => setState(() => isMale = false),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 18),
//                 HeightCard(
//                   height: height,
//                   onChanged: (v) => setState(() => height = v),
//                 ),
//                 const SizedBox(height: 18),
//                 LayoutBuilder(
//                   builder: (context, constraints) {
//                     final double gap = 10;
//                     final double itemWidth = (constraints.maxWidth - gap) / 2;
//                     return Row(
//                       children: [
//                         SizedBox(
//                           width: itemWidth,
//                           child: NumberCard(
//                             title: 'Weight',
//                             value: '$weight kg',
//                             onMinus: () => _changeWeight(-1),
//                             onPlus: () => _changeWeight(1),
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         SizedBox(
//                           width: itemWidth,
//                           child: NumberCard(
//                             title: 'Age',
//                             value: '$age',
//                             onMinus: () => _changeAge(-1),
//                             onPlus: () => _changeAge(1),
//                           ),
//                         ),
//                       ],
//                     );
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 NextButton(onTap: _onNextPressed),
//                 const SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
