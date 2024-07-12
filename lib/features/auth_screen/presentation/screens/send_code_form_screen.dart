import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/common/constants/colors.dart';
import 'package:on_a_trip/common/constants/spaces.dart';
import 'package:on_a_trip/common/helper/utils.dart';
import 'package:on_a_trip/common/widgets/back_button_appbar.dart';
import 'package:on_a_trip/common/widgets/button_loading_indicator.dart';
import 'package:on_a_trip/common/widgets/custom_container.dart';
import 'package:on_a_trip/features/auth_screen/presentation/provider/auth_screen_provider.dart';
import 'package:on_a_trip/features/auth_screen/presentation/screens/verify_otp_form_screen.dart';
import 'package:on_a_trip/gen/assets.gen.dart';
import 'package:provider/provider.dart';

class SendCodeFormScreen extends StatefulWidget {
  const SendCodeFormScreen({super.key});

  @override
  State<SendCodeFormScreen> createState() => _SendCodeFormScreenState();
}

class _SendCodeFormScreenState extends State<SendCodeFormScreen> {
  final TextEditingController emailController = TextEditingController();

  Future<void> _sendOtp() async {
    try {
      if (emailController.text.isEmpty) {
        throw 'Email is required';
      }
      final authProvider = context.read<AuthScreenProvider>();
      if(authProvider.isLoading) {
        throw 'Please wait for the previous action to complete';
      };
      authProvider.sendOtpEmail = emailController.text;
      await authProvider.sendOtp();
      authProvider.startTime();
    } catch (e) {
      rethrow;
    }
  }

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
              Assets.svg.key.svg(width: 80),
              SizedBox(height: 24.h),
              const Text(
                'Reset Password',
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
                  "Please enter your number. We will send a code to your phone to reset your password.",
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
                child: Consumer<AuthScreenProvider>(
                  builder: (context, authScreenProvider, child) {
                    return Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          enabled: !authScreenProvider.isLoading,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: "Email",
                            prefixIcon: Icon(Icons.email_outlined),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              try {
                                await _sendOtp();
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const VerifyOtpFormScreen(),
                                  ),
                                );
                              } catch (e) {
                                Utils.showSnackBar(context, content: e.toString());
                              }
                            },
                            child: (authScreenProvider.isLoading) ? const ButtonLoadingIndicator() : const Text('Send my Code'),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
