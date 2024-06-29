import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/common/constants/colors.dart';
import 'package:on_a_trip/common/constants/spaces.dart';
import 'package:on_a_trip/common/widgets/back_button_appbar.dart';
import 'package:on_a_trip/common/widgets/custom_container.dart';
import 'package:on_a_trip/features/auth_screen/presentation/screens/reset_password_form_screen.dart';
import 'package:on_a_trip/gen/assets.gen.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';

class VerifyOtpFormScreen extends StatefulWidget {
  const VerifyOtpFormScreen({super.key});

  @override
  State<VerifyOtpFormScreen> createState() => _VerifyOtpFormScreenState();
}

class _VerifyOtpFormScreenState extends State<VerifyOtpFormScreen> {
  final OtpFieldControllerV2 otpController = OtpFieldControllerV2();

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
            children: <Widget>[
              const BackButtonAppBar(),
              SizedBox(height: 36.h),
              Assets.svg.phone.svg(width: 48),
              SizedBox(height: 24.h),
              const Text(
                'Verify Code',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.headingColor,
                ),
              ),
              SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: const Text(
                  "Please enter the verification code sent to your phone number",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: CustomColors.highlightText,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              CustomContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Enter Code",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.titleColor,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    OTPTextFieldV2(
                      length: 4,
                      spaceBetween: 20,
                      fieldWidth: 56.w,
                      width: double.infinity,
                      outlineBorderRadius: 6,
                      controller: otpController,
                      fieldStyle: FieldStyle.underline,
                      textFieldAlignment: MainAxisAlignment.center,
                      onCompleted: (value) {},
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text("Resend Code"),
                        ),
                        SizedBox(width: 10.w),
                        const Text(
                          "00:59s",
                          style: TextStyle(
                            color: CustomColors.highlightText,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const ResetPasswordFormScreen()),
                          );
                        },
                        child: const Text('Send my Code'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
