import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/common/constants/colors.dart';
import 'package:on_a_trip/common/constants/spaces.dart';
import 'package:on_a_trip/common/widgets/back_button_appbar.dart';
import 'package:on_a_trip/common/widgets/custom_container.dart';
import 'package:on_a_trip/features/auth_screen/presentation/provider/auth_screen_provider.dart';
import 'package:on_a_trip/features/home_screen/presentation/screens/bottom_navigation_screen.dart';
import 'package:provider/provider.dart';

class HotelierFormScreen extends StatefulWidget {
  const HotelierFormScreen({super.key});

  @override
  State<HotelierFormScreen> createState() => HotelierFormScreenState();
}

class HotelierFormScreenState extends State<HotelierFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: Spaces.defaultVerticalPadding,
            horizontal: Spaces.defaultHorizontalPadding,
          ),
          child: Consumer<AuthScreenProvider>(
            builder: (context, authScreenProvider, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const BackButtonAppBar(),
                  SizedBox(height: 24.h),
                  const Text(
                    "Hotelier",
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
                      "Please enter your details to create your Hotelier profile",
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.corporate_fare),
                            labelText: "Company Name",
                          ),
                        ),
                        SizedBox(height: 16.h),
                        TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.pin_drop),
                            labelText: "Address",
                          ),
                        ),
                        SizedBox(height: 16.h),
                        TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.credit_card),
                            labelText: "PAN Card",
                          ),
                        ),
                        SizedBox(height: 16.h),
                        TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.confirmation_number_outlined),
                            labelText: "Reg. Certificate",
                          ),
                        ),
                        SizedBox(height: 16.h),
                        TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.credit_card),
                            labelText: "Business Card",
                          ),
                        ),
                        SizedBox(height: 20.h),
                        const Text(
                          "Upload Hotel Images",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: CustomColors.titleColor,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Icon(
                            size: 18,
                            Icons.add_a_photo,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        const Text(
                          "Upload Owner Photo",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: CustomColors.titleColor,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Icon(
                            size: 18,
                            Icons.add_a_photo,
                          ),
                        ),
                        SizedBox(height: 36.h),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const BottomNavigationScreen(
                                    userType: "hotelier",
                                  ),
                                ),
                              );
                            },
                            child: const Text("Create Profile"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
