import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/common/constants/colors.dart';
import 'package:on_a_trip/common/constants/spaces.dart';
import 'package:on_a_trip/common/helper/utils.dart';
import 'package:on_a_trip/common/widgets/back_button_appbar.dart';
import 'package:on_a_trip/common/widgets/button_loading_indicator.dart';
import 'package:on_a_trip/common/widgets/custom_container.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/login_usecase.dart';
import 'package:on_a_trip/features/auth_screen/presentation/provider/auth_screen_provider.dart';
import 'package:on_a_trip/features/auth_screen/presentation/screens/hotelier_form_screen.dart';
import 'package:on_a_trip/features/auth_screen/presentation/screens/send_code_form_screen.dart';
import 'package:on_a_trip/features/auth_screen/presentation/screens/signup_form_screen.dart';
import 'package:on_a_trip/features/auth_screen/presentation/screens/transporter_form_screen.dart';
import 'package:on_a_trip/features/auth_screen/presentation/screens/travel_agent_from_screen.dart';
import 'package:on_a_trip/features/home_screen/presentation/screens/bottom_navigation_screen.dart';
import 'package:on_a_trip/gen/assets.gen.dart';
import 'package:provider/provider.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({
    super.key,
    required this.userType,
  });

  final String userType;

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> loginUser() async {
    try {
      await context.read<AuthScreenProvider>().login(
            params: LoginParams(
              email: emailController.text,
              password: passwordController.text,
            ),
          );
      await context.read<AuthScreenProvider>().getUserDetails();
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
            children: [
              const BackButtonAppBar(),
              SizedBox(height: 20.h),
              Assets.images.businessUser.image(width: 240),
              SizedBox(height: 24.h),
              const Text(
                "Login",
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
                  "Please enter your credentials to",
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
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextFormField(
                          enabled: !authScreenProvider.isLoading,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: "Email",
                            prefixIcon: Icon(Icons.email_outlined),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        TextFormField(
                          enabled: !authScreenProvider.isLoading,
                          controller: passwordController,
                          obscureText: authScreenProvider.isObscure,
                          decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              onPressed: () {
                                authScreenProvider.isObscure = !authScreenProvider.isObscure;
                              },
                              splashRadius: 20,
                              padding: EdgeInsets.zero,
                              visualDensity: VisualDensity.compact,
                              icon: (authScreenProvider.isObscure) ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                            ),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        TextButton(
                          onPressed: () async {
                            try {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const SendCodeFormScreen(),
                                ),
                              );
                            } catch (e) {
                              Utils.showSnackBar(context, content: e.toString());
                            }
                          },
                          child: const Text("Forgot Password?"),
                        ),
                        SizedBox(height: 24.h),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              try {
                                if (authScreenProvider.isLoading) {
                                  throw "Please wait for the current process to finish";
                                }
                                if (emailController.text.isEmpty) {
                                  throw "Email is required";
                                }
                                if (passwordController.text.isEmpty) {
                                  throw "Password is required";
                                }
                                await loginUser();
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
                                    builder: (context) => const BottomNavigationScreen(
                                      userType: "user",
                                    ),
                                  ),
                                  (context) => false,
                                );
                              } catch (e) {
                                Utils.showSnackBar(context, content: e.toString());
                              }
                            },
                            child: (authScreenProvider.isLoading) ? const ButtonLoadingIndicator() : const Text("Sign In"),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "New User?",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 6),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => SignupFormScreen(userType: widget.userType),
                        ),
                      );
                    },
                    child: const Text("Sign Up"),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Text(
                      "or continue with",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: 24.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    foregroundColor: Colors.black,
                    backgroundColor: const Color(0xffEEEEEE),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.svg.google.svg(),
                      const SizedBox(width: 8),
                      const Text("Google"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: const Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Text(
                      "By clicking continue, you agree to our ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Terms of Service ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "and ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Privacy Policy",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
