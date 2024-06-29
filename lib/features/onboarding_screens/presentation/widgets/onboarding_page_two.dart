import 'package:flutter/material.dart';
import 'package:on_a_trip/features/onboarding_screens/presentation/widgets/onboarding_screen_widget.dart';
import 'package:on_a_trip/gen/assets.gen.dart';

class OnboardinPageTwo extends StatelessWidget {
  const OnboardinPageTwo({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Assets.images.onboarding2.image(
          fit: BoxFit.contain,
        ),
        OnboardingScreenWidget(
          onTap: onTap,
          title: "Book your Trip",
          subtitle: "How can I assist you with your travel plans?",
        ),
      ],
    );
  }
}
