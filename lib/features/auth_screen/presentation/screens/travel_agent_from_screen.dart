import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:on_a_trip/common/constants/colors.dart';
import 'package:on_a_trip/common/constants/spaces.dart';
import 'package:on_a_trip/common/helper/image_picker_class.dart';
import 'package:on_a_trip/common/helper/utils.dart';
import 'package:on_a_trip/common/widgets/back_button_appbar.dart';
import 'package:on_a_trip/common/widgets/button_loading_indicator.dart';
import 'package:on_a_trip/common/widgets/custom_container.dart';
import 'package:on_a_trip/common/widgets/pick_media_source_dialog.dart';
import 'package:on_a_trip/common/widgets/show_image_widget.dart';
import 'package:on_a_trip/features/auth_screen/presentation/provider/auth_screen_provider.dart';
import 'package:on_a_trip/features/auth_screen/presentation/provider/create_profile_provider.dart';
import 'package:on_a_trip/features/home_screen/presentation/screens/bottom_navigation_screen.dart';
import 'package:on_a_trip/features/onboarding_screens/presentation/screens/onboarding_screen.dart';
import 'package:provider/provider.dart';

class TravelAgentFromScreen extends StatefulWidget {
  const TravelAgentFromScreen({super.key});

  @override
  State<TravelAgentFromScreen> createState() => _TravelAgentFromScreenState();
}

class _TravelAgentFromScreenState extends State<TravelAgentFromScreen> {
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController aadharCardController = TextEditingController();
  final TextEditingController panCardController = TextEditingController();
  final TextEditingController regCertificateController = TextEditingController();

  Future<void> _createProfile() async {
    try {
      final createProfileProvider = context.read<CreateProfileProvider>();
      if (companyNameController.text.isEmpty) {
        throw "Company name is required";
      }
      if (addressController.text.isEmpty) {
        throw "Company name is required";
      }
      if (aadharCardController.text.isEmpty) {
        throw "Company name is required";
      }
      if (panCardController.text.isEmpty) {
        throw "Company name is required";
      }
      if (regCertificateController.text.isEmpty) {
        throw "Company name is required";
      }

      Map<String, dynamic> body = {
        "type": "addUserDetails",
        "transport": createProfileProvider.travelAgentTransportAv! ? "1" : "0",
        "company_name": companyNameController.text.trim(),
        "address": addressController.text.trim(),
        "aadhar_card": aadharCardController.text.trim(),
        "pan_card": panCardController.text.trim(),
        "reg_certificate": regCertificateController.text.trim(),
      };

      Map<String, File> images = {};

      if (createProfileProvider.travelAgentOwnerImage != null) {
        images["owner_image"] = createProfileProvider.travelAgentOwnerImage!;
      }
      if (createProfileProvider.travelAgentOfficeImage != null) {
        images["office_image"] = createProfileProvider.travelAgentOwnerImage!;
      }

      await createProfileProvider.createProfile(body: body, images: images);
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
          child: Consumer<CreateProfileProvider>(
            builder: (context, createProfileProvider, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: PopScope(
                          canPop: false,
                          onPopInvoked: (value) {
                            if (Navigator.of(context).canPop()) {
                              Navigator.of(context).pop();
                            } else {
                              SystemNavigator.pop();
                            }
                          },
                          child: const BackButtonAppBar(),
                        ),
                      ),
                      TextButton(
                        child: const Text("Change Account"),
                        onPressed: () async {
                          try {
                            await context.read<AuthScreenProvider>().logout();
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const OnboardingScreen(),
                              ),
                              (context) => false,
                            );
                          } catch (e) {
                            Utils.showSnackBar(context, content: e.toString());
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  const Text(
                    "Travel Agent",
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
                      "Please enter your details to create your Travel Agent profile",
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
                    child: Consumer<CreateProfileProvider>(
                      builder: (context, createProfileProvider, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              enabled: !createProfileProvider.isLoading,
                              controller: companyNameController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.corporate_fare),
                                labelText: "Company Name",
                              ),
                            ),
                            SizedBox(height: 16.h),
                            TextFormField(
                              enabled: !createProfileProvider.isLoading,
                              controller: addressController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.pin_drop),
                                labelText: "Address",
                              ),
                            ),
                            SizedBox(height: 16.h),
                            TextFormField(
                              enabled: !createProfileProvider.isLoading,
                              controller: aadharCardController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.perm_identity),
                                labelText: "Aadhar Card",
                              ),
                            ),
                            SizedBox(height: 16.h),
                            TextFormField(
                              enabled: !createProfileProvider.isLoading,
                              controller: panCardController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.add_card),
                                labelText: "PAN Card",
                              ),
                            ),
                            SizedBox(height: 16.h),
                            TextFormField(
                              enabled: !createProfileProvider.isLoading,
                              controller: regCertificateController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.confirmation_number_outlined),
                                labelText: "Reg. Certificate",
                              ),
                            ),
                            SizedBox(height: 20.h),
                            const Text(
                              "Transport Available?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: CustomColors.titleColor,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Radio(
                                        value: true,
                                        groupValue: createProfileProvider.travelAgentTransportAv,
                                        onChanged: (newVal) {
                                          createProfileProvider.travelAgentTransportAv = newVal;
                                        },
                                        fillColor: WidgetStateColor.resolveWith(
                                          (states) {
                                            if (states.contains(WidgetState.focused)) {
                                              return CustomColors.primaryColor;
                                            }
                                            return CustomColors.primaryColor.withOpacity(0.8);
                                          },
                                        ),
                                      ),
                                      const Text("Yes"),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Radio(
                                        value: false,
                                        groupValue: createProfileProvider.travelAgentTransportAv,
                                        onChanged: (newVal) {
                                          createProfileProvider.travelAgentTransportAv = newVal;
                                        },
                                        fillColor: WidgetStateColor.resolveWith(
                                          (states) {
                                            if (states.contains(WidgetState.focused)) {
                                              return CustomColors.primaryColor;
                                            }
                                            return CustomColors.primaryColor.withOpacity(0.8);
                                          },
                                        ),
                                      ),
                                      const Text("No"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            const Text(
                              "Upload Office Images",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: CustomColors.titleColor,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            (createProfileProvider.travelAgentOfficeImage != null)
                                ? ShowImageWidget(
                                    image: createProfileProvider.travelAgentOfficeImage!,
                                    onTap: () {
                                      createProfileProvider.travelAgentOfficeImage = null;
                                    },
                                  )
                                : ElevatedButton(
                                    onPressed: () async {
                                      try {
                                        final source = await showDialog<ImageSource>(
                                          context: context,
                                          builder: (context) => const MediaSourcePopup(),
                                        );

                                        File? pickedFile;

                                        if (source == ImageSource.camera) {
                                          pickedFile = await FetchImage.pickImage(ImageSource.camera);
                                        } else if (source == ImageSource.gallery) {
                                          pickedFile = await FetchImage.pickImage(ImageSource.gallery);
                                        }

                                        createProfileProvider.travelAgentOfficeImage = pickedFile;
                                      } catch (e) {
                                        Utils.showSnackBar(context, content: e.toString());
                                      }
                                    },
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
                            (createProfileProvider.travelAgentOwnerImage != null)
                                ? ShowImageWidget(
                                    image: createProfileProvider.travelAgentOwnerImage!,
                                    onTap: () {
                                      createProfileProvider.travelAgentOwnerImage = null;
                                    },
                                  )
                                : ElevatedButton(
                                    onPressed: () async {
                                      try {
                                        final source = await showDialog<ImageSource>(
                                          context: context,
                                          builder: (context) => const MediaSourcePopup(),
                                        );

                                        File? pickedFile;

                                        if (source == ImageSource.camera) {
                                          pickedFile = await FetchImage.pickImage(ImageSource.camera);
                                        } else if (source == ImageSource.gallery) {
                                          pickedFile = await FetchImage.pickImage(ImageSource.gallery);
                                        }

                                        createProfileProvider.travelAgentOwnerImage = pickedFile;
                                      } catch (e) {
                                        Utils.showSnackBar(context, content: e.toString());
                                      }
                                    },
                                    child: const Icon(
                                      size: 18,
                                      Icons.add_a_photo,
                                    ),
                                  ),
                            SizedBox(height: 36.h),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  try {
                                    await _createProfile();
                                    Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (context) => const BottomNavigationScreen(
                                          userType: "travel_agent",
                                        ),
                                      ),
                                      (context) => false,
                                    );
                                  } catch (e) {
                                    Utils.showSnackBar(context, content: e.toString());
                                  }
                                },
                                child: (createProfileProvider.isLoading) ? const ButtonLoadingIndicator() : const Text("Create Profile"),
                              ),
                            ),
                          ],
                        );
                      },
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
