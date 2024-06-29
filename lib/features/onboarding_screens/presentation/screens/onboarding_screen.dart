import 'package:flutter/material.dart';
import 'package:on_a_trip/common/constants/spaces.dart';
import 'package:on_a_trip/features/onboarding_screens/presentation/widgets/onboarding_page_one.dart';
import 'package:on_a_trip/features/onboarding_screens/presentation/widgets/onboarding_page_two.dart';
import 'package:on_a_trip/features/onboarding_screens/presentation/widgets/onboarding_page_three.dart';
import 'package:on_a_trip/features/auth_screen/presentation/screens/select_signup_user_type_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Spaces.defaultVerticalPadding,
            horizontal: Spaces.defaultHorizontalPadding,
          ),
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              OnboardinPageOne(
                onTap: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeIn,
                  );
                },
              ),
              OnboardinPageTwo(
                onTap: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeIn,
                  );
                },
              ),
              OnboardingPageThree(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const SelectSignupUserTypeScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
