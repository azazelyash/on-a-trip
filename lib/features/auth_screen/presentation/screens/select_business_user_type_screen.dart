import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/common/constants/colors.dart';
import 'package:on_a_trip/common/constants/spaces.dart';
import 'package:on_a_trip/common/widgets/back_button_appbar.dart';
import 'package:on_a_trip/features/auth_screen/presentation/widgets/signup_type_widget.dart';
import 'package:on_a_trip/gen/assets.gen.dart';

class SelectBusinessUserTypeScreen extends StatelessWidget {
  const SelectBusinessUserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: Spaces.defaultVerticalPadding,
            horizontal: Spaces.defaultHorizontalPadding,
          ),
          child: Column(
            children: [
              const BackButtonAppBar(),
              SizedBox(height: 24.h),
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
                  "Please select the business user type",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: CustomColors.highlightText,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              SignUpTypeWidget(
                title: "Hotelier",
                image: Assets.images.hotelier.image(
                  width: 150,
                ),
              ),
              SizedBox(height: 12.h),
              SignUpTypeWidget(
                title: "Travel Agent",
                image: Assets.images.travelAgent.image(
                  width: 150,
                ),
              ),
              SizedBox(height: 12.h),
              SignUpTypeWidget(
                title: "Transporter",
                image: Assets.images.transporter.image(
                  width: 150,
                ),
              ),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
    );
  }
}
