import 'package:flutter/material.dart';
import 'package:on_a_trip/features/onboarding_screens/presentation/widgets/onboarding_screen_widget.dart';
import 'package:on_a_trip/gen/assets.gen.dart';

class OnboardingPageThree extends StatelessWidget {
  const OnboardingPageThree({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Assets.images.onboarding3.image(
          fit: BoxFit.contain,
        ),
        OnboardingScreenWidget(
          onTap: onTap,
          title: "Create your Pakage",
          subtitle: "Structured approach to help you create your own package.",
        ),
      ],
    );
  }
}
