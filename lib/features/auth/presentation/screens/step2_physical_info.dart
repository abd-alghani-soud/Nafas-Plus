import 'package:flutter/material.dart';

import 'package:nafas/core/constants/my_colors.dart';
import 'package:nafas/features/auth/presentation/widgets/custom_button.dart';
import 'package:nafas/features/auth/presentation/widgets/next_button.dart';
import 'package:nafas/features/auth/presentation/widgets/number_card.dart';

import 'package:nafas/features/auth/presentation/widgets/height_ruler_picker.dart';

class Step2PhysicalInfo extends StatefulWidget {
  final Function(double height, int weight, int age) onFinish;
  final VoidCallback onBack;
  final double initialHeight;
  final int initialWeight;
  final int initialAge;

  const Step2PhysicalInfo({
    super.key,
    required this.onFinish,
    required this.onBack,
    this.initialHeight = 170,
    this.initialWeight = 65,
    this.initialAge = 25,
  });

  @override
  State<Step2PhysicalInfo> createState() => _Step2PhysicalInfoState();
}

class _Step2PhysicalInfoState extends State<Step2PhysicalInfo> {
  late double _height;
  late int _weight;
  late int _age;

  @override
  void initState() {
    super.initState();
    _height = widget.initialHeight;
    _weight = widget.initialWeight;
    _age = widget.initialAge;
  }

  void _changeWeight(int delta) {
    setState(() {
      _weight = (_weight + delta).clamp(1, 500);
    });
  }

  void _changeAge(int delta) {
    setState(() {
      _age = (_age + delta).clamp(1, 150);
    });
  }

  void _handleFinish() {
    widget.onFinish(_height, _weight, _age);
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),

          _buildStepIndicator(2, 2),
          const SizedBox(height: 20),

          HeightRulerPicker(
            initialHeight: _height,
            onChanged: (v) => setState(() => _height = v),
          ),

          const SizedBox(height: 20),

          LayoutBuilder(
            builder: (context, constraints) {
              final double gap = 10;
              final double itemWidth = (constraints.maxWidth - gap) / 2;
              return Row(
                children: [
                  SizedBox(
                    width: itemWidth,
                    child: NumberCard(
                      title: 'Weight',
                      value: '$_weight kg',
                      onMinus: () => _changeWeight(-1),
                      onPlus: () => _changeWeight(1),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: itemWidth,
                    child: NumberCard(
                      title: 'Age',
                      value: '$_age',
                      onMinus: () => _changeAge(-1),
                      onPlus: () => _changeAge(1),
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 30),
          CustomButton(onPressed: _handleFinish, text: 'finish'),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
