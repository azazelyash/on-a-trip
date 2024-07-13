import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/common/constants/colors.dart';
import 'package:on_a_trip/common/constants/spaces.dart';
import 'package:on_a_trip/common/helper/utils.dart';
import 'package:on_a_trip/common/widgets/back_button_appbar.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/create_account_usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/login_usecase.dart';
import 'package:on_a_trip/features/auth_screen/presentation/provider/auth_screen_provider.dart';
import 'package:on_a_trip/features/auth_screen/presentation/screens/hotelier_form_screen.dart';
import 'package:on_a_trip/features/auth_screen/presentation/screens/transporter_form_screen.dart';
import 'package:on_a_trip/features/auth_screen/presentation/screens/travel_agent_from_screen.dart';
import 'package:on_a_trip/features/auth_screen/presentation/widgets/signup_type_widget.dart';
import 'package:on_a_trip/gen/assets.gen.dart';
import 'package:provider/provider.dart';

class SelectBusinessUserTypeScreen extends StatefulWidget {
  const SelectBusinessUserTypeScreen({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });

  final String name;
  final String email;
  final String phone;
  final String password;

  @override
  State<SelectBusinessUserTypeScreen> createState() => _SelectBusinessUserTypeScreenState();
}

class _SelectBusinessUserTypeScreenState extends State<SelectBusinessUserTypeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<AuthScreenProvider>().selectedBusinessUserType = null);
  }

  Future<void> _createAccount({required String selectedBusinessType}) async {
    try {
      await context.read<AuthScreenProvider>().createAccount(
            params: CreateAccountParams(
              name: widget.name,
              email: widget.email,
              password: widget.password,
              phone: widget.phone,
              userType: selectedBusinessType,
            ),
          );
      await context.read<AuthScreenProvider>().login(
            params: LoginParams(
              email: widget.email,
              password: widget.password,
            ),
          );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: (context.watch<AuthScreenProvider>().selectedBusinessUserType != null)
          ? Padding(
              padding: const EdgeInsets.all(12),
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    final authScreenProvider = context.read<AuthScreenProvider>();
                    await _createAccount(
                      selectedBusinessType: authScreenProvider.selectedBusinessUserType!,
                    );
                    if (authScreenProvider.selectedBusinessUserType == "hotelier") {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const HotelierFormScreen()),
                      );
                    } else if (authScreenProvider.selectedBusinessUserType == "travel_agent") {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const TravelAgentFromScreen()),
                      );
                    } else if (authScreenProvider.selectedBusinessUserType == "transporter") {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const TransporterFormScreen()),
                      );
                    }
                  } catch (e) {
                    Utils.showSnackBar(context, content: e.toString());
                  }
                },
                child: const Text("Create Account"),
              ),
            )
          : const SizedBox.shrink(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: Spaces.defaultVerticalPadding,
            horizontal: Spaces.defaultHorizontalPadding,
          ),
          child: Consumer<AuthScreenProvider>(
            builder: (context, authScreenProvider, child) {
              return Column(
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
                    isSelected: authScreenProvider.selectedBusinessUserType == "hotelier",
                    title: "Hotelier",
                    onTap: () {
                      authScreenProvider.selectedBusinessUserType = "hotelier";
                    },
                    image: Assets.images.hotelier.image(
                      width: 150,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  SignUpTypeWidget(
                    onTap: () {
                      authScreenProvider.selectedBusinessUserType = "travel_agent";
                    },
                    isSelected: authScreenProvider.selectedBusinessUserType == "travel_agent",
                    title: "Travel Agent",
                    image: Assets.images.travelAgent.image(
                      width: 150,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  SignUpTypeWidget(
                    isSelected: authScreenProvider.selectedBusinessUserType == "transporter",
                    onTap: () {
                      authScreenProvider.selectedBusinessUserType = "transporter";
                    },
                    title: "Transporter",
                    image: Assets.images.transporter.image(
                      width: 150,
                    ),
                  ),
                  SizedBox(height: 18.h),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
