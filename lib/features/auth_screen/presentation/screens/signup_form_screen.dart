import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/common/constants/colors.dart';
import 'package:on_a_trip/common/constants/spaces.dart';
import 'package:on_a_trip/common/helper/utils.dart';
import 'package:on_a_trip/common/widgets/back_button_appbar.dart';
import 'package:on_a_trip/common/widgets/button_loading_indicator.dart';
import 'package:on_a_trip/common/widgets/custom_container.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/create_account_usecase.dart';
import 'package:on_a_trip/features/auth_screen/presentation/provider/auth_screen_provider.dart';
import 'package:on_a_trip/features/auth_screen/presentation/screens/login_form_screen.dart';
import 'package:on_a_trip/features/auth_screen/presentation/screens/select_business_user_type_screen.dart';
import 'package:on_a_trip/features/home_screen/presentation/screens/bottom_navigation_screen.dart';
import 'package:provider/provider.dart';

class SignupFormScreen extends StatefulWidget {
  const SignupFormScreen({
    super.key,
    required this.userType,
  });

  final String userType;

  @override
  State<SignupFormScreen> createState() => _SignupFormScreenState();
}

class _SignupFormScreenState extends State<SignupFormScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  Future<void> _createAccount() async {
    try {
      if (_nameController.text.isEmpty) {
        throw "Name is required";
      }
      if (_emailController.text.isEmpty) {
        throw "Email is required";
      }
      if (_phoneController.text.isEmpty) {
        throw "Phone is required";
      }
      if (_passwordController.text.isEmpty) {
        throw "Password is required";
      }
      if (_confirmPasswordController.text.isEmpty) {
        throw "Confirm Password is required";
      }
      if (_passwordController.text != _confirmPasswordController.text) {
        throw "Password and Confirm Password must be same";
      }

      if (widget.userType == "business") {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SelectBusinessUserTypeScreen(
              name: _nameController.text.trim(),
              email: _emailController.text.trim(),
              phone: _phoneController.text.trim(),
              password: _passwordController.text.trim(),
            ),
          ),
        );
      } else {
        await context.read<AuthScreenProvider>().createAccount(
              params: CreateAccountParams(
                name: _nameController.text.trim(),
                email: _emailController.text.trim(),
                password: _passwordController.text.trim(),
                phone: _phoneController.text.trim(),
                userType: "traveller",
              ),
            );
      }
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
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  "Please enter your details to sign up and create an account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: CustomColors.highlightText,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              CustomContainer(
                child: Consumer<AuthScreenProvider>(
                  builder: (context, authScreenProvider, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          enabled: !authScreenProvider.isLoading,
                          controller: _nameController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person_outlined),
                            labelText: "Your Name",
                          ),
                        ),
                        SizedBox(height: 16.h),
                        TextFormField(
                          enabled: !authScreenProvider.isLoading,
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            labelText: "Email",
                          ),
                        ),
                        SizedBox(height: 16.h),
                        TextFormField(
                          maxLength: 10,
                          enabled: !authScreenProvider.isLoading,
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.call_outlined),
                            labelText: "Phone Number",
                          ),
                        ),
                        SizedBox(height: 16.h),
                        TextFormField(
                          obscureText: authScreenProvider.isObscure,
                          enabled: !authScreenProvider.isLoading,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock_outlined),
                            labelText: "Password",
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
                        SizedBox(height: 16.h),
                        TextFormField(
                          obscureText: authScreenProvider.isObscure,
                          enabled: !authScreenProvider.isLoading,
                          controller: _confirmPasswordController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock_outlined),
                            labelText: "Confirm Password",
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
                        SizedBox(height: 36.h),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              try {
                                await _createAccount();
                              } catch (e) {
                                Utils.showSnackBar(context, content: e.toString());
                              }
                            },
                            child: (authScreenProvider.isLoading)
                                ? const ButtonLoadingIndicator()
                                : (widget.userType == "business")
                                    ? const Text("Continue")
                                    : const Text("Sign up"),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Do you have an account?",
                    style: TextStyle(
                      color: CustomColors.highlightText,
                    ),
                  ),
                  const SizedBox(width: 6),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginFormScreen(userType: widget.userType)),
                      );
                    },
                    child: const Text("Log In"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
