import 'dart:io';

import 'package:flutter/material.dart';
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
import 'package:provider/provider.dart';

class TransporterFormScreen extends StatefulWidget {
  const TransporterFormScreen({super.key});

  @override
  State<TransporterFormScreen> createState() => _TransporterFormScreenState();
}

class _TransporterFormScreenState extends State<TransporterFormScreen> {
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController aadharCardController = TextEditingController();
  final TextEditingController panCardController = TextEditingController();
  final TextEditingController regCertificateController = TextEditingController();
  final TextEditingController drrivingExpController = TextEditingController();
  final TextEditingController numOfCabsController = TextEditingController();
  final TextEditingController typeOfCabsController = TextEditingController();

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
      if (drrivingExpController.text.isEmpty) {
        throw "Driving Experience is required";
      }
      if (numOfCabsController.text.isEmpty) {
        throw "Number of Cabs is required";
      }
      if (typeOfCabsController.text.isEmpty) {
        throw "Types of Cabs is required";
      }

      Map<String, dynamic> body = {
        "type": "addUserDetails",
        "company_name": companyNameController.text.trim(),
        "address": addressController.text.trim(),
        "aadhar_card": aadharCardController.text.trim(),
        "pan_card": panCardController.text.trim(),
        "reg_certificate": regCertificateController.text.trim(),
        "no_of_cabs": numOfCabsController.text.trim(),
        "driving_exp": drrivingExpController.text.trim(),
        "type_of_cab": typeOfCabsController.text.trim(),
      };

      Map<String, File> images = {};

      if (createProfileProvider.transporterBusinessCardImage != null) {
        images["business_card"] = createProfileProvider.transporterBusinessCardImage!;
      }
      if (createProfileProvider.transporterCabImage != null) {
        images["cab_image"] = createProfileProvider.transporterCabImage!;
      }
      if (createProfileProvider.transporterCompanyImage != null) {
        images["company_image"] = createProfileProvider.transporterCompanyImage!;
      }
      if (createProfileProvider.transporterOwnerImage != null) {
        images["owner_image"] = createProfileProvider.transporterOwnerImage!;
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
          child: Consumer<AuthScreenProvider>(
            builder: (context, authScreenProvider, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const BackButtonAppBar(),
                  SizedBox(height: 24.h),
                  const Text(
                    "Transporter",
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
                      "Please enter your details to create your Transporter profile",
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
                                prefixIcon: Icon(Icons.perm_identity_outlined),
                                labelText: "Aadhar Card",
                              ),
                            ),
                            SizedBox(height: 16.h),
                            TextFormField(
                              enabled: !createProfileProvider.isLoading,
                              controller: panCardController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.credit_card),
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
                            SizedBox(height: 16.h),
                            TextFormField(
                              enabled: !createProfileProvider.isLoading,
                              controller: drrivingExpController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.drive_eta),
                                labelText: "Driving Experience",
                              ),
                            ),
                            SizedBox(height: 16.h),
                            TextFormField(
                              enabled: !createProfileProvider.isLoading,
                              controller: numOfCabsController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.car_rental),
                                labelText: "Number of Cabs",
                              ),
                            ),
                            SizedBox(height: 16.h),
                            TextFormField(
                              enabled: !createProfileProvider.isLoading,
                              controller: typeOfCabsController,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.category_outlined),
                                labelText: "Types of Cabs",
                              ),
                            ),
                            SizedBox(height: 20.h),
                            const Text(
                              "Upload Business Card",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: CustomColors.titleColor,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            (createProfileProvider.transporterBusinessCardImage != null)
                                ? ShowImageWidget(
                                    image: createProfileProvider.transporterBusinessCardImage!,
                                    onTap: () {
                                      createProfileProvider.transporterBusinessCardImage = null;
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

                                        createProfileProvider.transporterBusinessCardImage = pickedFile;
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
                              "Upload Company Images",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: CustomColors.titleColor,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            (createProfileProvider.transporterCompanyImage != null)
                                ? ShowImageWidget(
                                    image: createProfileProvider.transporterCompanyImage!,
                                    onTap: () {
                                      createProfileProvider.transporterCompanyImage = null;
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

                                        createProfileProvider.transporterCompanyImage = pickedFile;
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
                              "Upload Cab Images",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: CustomColors.titleColor,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            (createProfileProvider.transporterCabImage != null)
                                ? ShowImageWidget(
                                    image: createProfileProvider.transporterCabImage!,
                                    onTap: () {
                                      createProfileProvider.transporterCabImage = null;
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

                                        createProfileProvider.transporterCabImage = pickedFile;
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
                            (createProfileProvider.transporterOwnerImage != null)
                                ? ShowImageWidget(
                                    image: createProfileProvider.transporterOwnerImage!,
                                    onTap: () {
                                      createProfileProvider.transporterOwnerImage = null;
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

                                        createProfileProvider.transporterOwnerImage = pickedFile;
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
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => const BottomNavigationScreen(
                                          userType: "transporter",
                                        ),
                                      ),
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
