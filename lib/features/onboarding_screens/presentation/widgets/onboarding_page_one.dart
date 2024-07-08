import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/features/onboarding_screens/presentation/widgets/onboarding_screen_widget.dart';
import 'package:on_a_trip/gen/assets.gen.dart';

class OnboardinPageOne extends StatelessWidget {
  const OnboardinPageOne({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Assets.images.onboarding1.image(
            fit: BoxFit.contain,
          ),
        ),
        OnboardingScreenWidget(
          onTap: onTap,
          title: "Explore the world",
          subtitle: "What aspect of exploration interests you the most?",
        ),
        SizedBox(height: 56.h),
      ],
    );
  }
}
