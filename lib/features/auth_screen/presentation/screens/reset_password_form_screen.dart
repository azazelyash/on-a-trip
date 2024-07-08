import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'hotelier_form_screen.dart';
import 'transporter_form_screen.dart';
import 'travel_agent_from_screen.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../common/helper/utils.dart';
import '../provider/auth_screen_provider.dart';
import '../../../../common/constants/colors.dart';
import '../../../../common/constants/spaces.dart';
import '../../../../common/widgets/custom_container.dart';
import '../../../../common/widgets/back_button_appbar.dart';
import '../../../../common/widgets/button_loading_indicator.dart';
import '../../../home_screen/presentation/screens/bottom_navigation_screen.dart';

class ResetPasswordFormScreen extends StatefulWidget {
  const ResetPasswordFormScreen({super.key});

  @override
  State<ResetPasswordFormScreen> createState() => _ResetPasswordFormScreenState();
}

class _ResetPasswordFormScreenState extends State<ResetPasswordFormScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  Future<void> _resetPassword() async {
    try {
      if (passwordController.text.isEmpty) {
        throw 'Password is required';
      }
      if (confirmPasswordController.text.isEmpty) {
        throw 'Confirm Password is required';
      }
      if (passwordController.text != confirmPasswordController.text) {
        throw 'Passwords do not match';
      }

      final authProvider = context.read<AuthScreenProvider>();

      await authProvider.resetPassword(password: passwordController.text);
      await authProvider.getUserDetails();
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
              Assets.svg.key.svg(width: 48),
              SizedBox(height: 24.h),
              const Text(
                'Create new Password',
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
                  "Please set a new and strong password",
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: passwordController,
                          enabled: !authScreenProvider.isLoading,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.lock_outlined),
                            labelText: "Password",
                          ),
                        ),
                        SizedBox(height: 16.h),
                        TextFormField(
                          controller: confirmPasswordController,
                          enabled: !authScreenProvider.isLoading,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.lock_outlined),
                            labelText: "Confirm Password",
                          ),
                        ),
                        // SizedBox(height: 12.h),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     TextButton(
                        //       onPressed: () {},
                        //       child: const Text("Resend Code"),
                        //     ),
                        //     SizedBox(width: 10.w),
                        //     const Text(
                        //       "00:59s",
                        //       style: TextStyle(
                        //         color: CustomColors.highlightText,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(height: 20.h),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              try {
                                await _resetPassword();
                                if (authScreenProvider.userModel!.userType != "traveller" && (authScreenProvider.userModel!.otherDetails == null || authScreenProvider.userModel!.otherDetails == false)) {
                                  if (authScreenProvider.userModel!.userType == "hotelier") {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => const HotelierFormScreen()),
                                    );
                                  } else if (authScreenProvider.userModel!.userType == "travel_agent") {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => const TravelAgentFromScreen()),
                                    );
                                  } else if (authScreenProvider.userModel!.userType == "transporter") {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => const TransporterFormScreen()),
                                    );
                                  }
                                  return;
                                }
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) => BottomNavigationScreen(
                                      userType: authScreenProvider.userModel!.userType!,
                                    ),
                                  ),
                                  (context) => false,
                                );
                              } catch (e) {
                                Utils.showSnackBar(context, content: e.toString());
                              }
                            },
                            child: (authScreenProvider.isLoading) ? const ButtonLoadingIndicator() : const Text('Reset Password'),
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
