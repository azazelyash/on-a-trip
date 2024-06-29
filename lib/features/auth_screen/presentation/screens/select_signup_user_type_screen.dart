import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/common/constants/colors.dart';
import 'package:on_a_trip/common/constants/spaces.dart';
import 'package:on_a_trip/features/auth_screen/presentation/screens/signup_form_screen.dart';
import 'package:on_a_trip/features/auth_screen/presentation/widgets/signup_type_widget.dart';
import 'package:on_a_trip/gen/assets.gen.dart';

class SelectSignupUserTypeScreen extends StatelessWidget {
  const SelectSignupUserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Spaces.defaultHorizontalPadding),
          child: Column(
            children: [
              const Spacer(flex: 2),
              const Text(
                "Signup",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.primaryColor,
                ),
              ),
              SizedBox(height: 12.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: const Text(
                  "Please select how you want to sign up and create an account as",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: CustomColors.highlightText,
                  ),
                ),
              ),
              const Spacer(),
              SignUpTypeWidget(
                onTap: () {
                  log("Traveller", name: "Signup user type");
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const SignupFormScreen(userType: "Traveller")),
                  );
                },
                title: "Traveller",
                image: Assets.images.traveller.image(width: 240),
              ),
              SizedBox(height: 32.h),
              SignUpTypeWidget(
                onTap: () {
                  log("Business User", name: "Signup user type");
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const SignupFormScreen(userType: "Business")),
                  );
                },
                title: "Business User",
                image: Assets.images.businessUser.image(width: 280),
              ),
              const Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}
