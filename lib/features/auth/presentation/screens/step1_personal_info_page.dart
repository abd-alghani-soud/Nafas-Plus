// lib/features/auth/presentation/screens/step1_personal_info.dart

import 'package:flutter/material.dart';
import 'package:nafas/core/constants/my_colors.dart';
import 'package:nafas/features/auth/presentation/widgets/custom_button.dart';
import 'package:nafas/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:nafas/features/auth/presentation/widgets/gender_card.dart';
import 'package:nafas/features/auth/presentation/widgets/next_button.dart';

class Step1PersonalInfo extends StatefulWidget {
  final Function(String firstName, bool isMale) onNext;
  final String initialFirstName;
  final bool initialIsMale;

  const Step1PersonalInfo({
    super.key,
    required this.onNext,
    this.initialFirstName = '',
    this.initialIsMale = true,
  });

  @override
  State<Step1PersonalInfo> createState() => _Step1PersonalInfoState();
}

class _Step1PersonalInfoState extends State<Step1PersonalInfo> {
  late TextEditingController _firstNameController;
  late bool _isMale;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: widget.initialFirstName);
    _isMale = widget.initialIsMale;
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    super.dispose();
  }

  void _handleNext() {
    final name = _firstNameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your first name')),
      );
      return;
    }
    widget.onNext(name, _isMale);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          _buildStepIndicator(1, 2),
          const SizedBox(height: 40),
          CustomTextField(
            controller: _firstNameController,
            label: 'First Name',
            hint: 'Enter your first name',
            isEmailField: false,
            isPasswordField: false,
            isSearchField: false,
            fillColor: MyColors.backgroundDark2,
          ),
          const SizedBox(height: 40),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Gender',
              style: TextStyle(
                color: MyColors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              GenderCard(
                icon: Icons.male,
                label: 'Male',
                active: _isMale,
                onTap: () => setState(() => _isMale = true),
              ),
              const SizedBox(width: 10),
              GenderCard(
                icon: Icons.female,
                label: 'Female',
                active: !_isMale,
                onTap: () => setState(() => _isMale = false),
              ),
            ],
          ),
          const SizedBox(height: 50),
          CustomButton(onPressed: _handleNext, text: 'Next'),
          // NextButton(onTap: _handleNext),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildStepIndicator(int currentStep, int totalSteps) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalSteps, (index) {
        final bool isCurrent = index + 1 == currentStep;
        final bool isCompleted = index + 1 < currentStep;
        return Flexible(
          child: Container(
            height: 5,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color:
                  isCurrent || isCompleted
                      ? MyColors.greenAccent
                      : MyColors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      }),
    );
  }
}
