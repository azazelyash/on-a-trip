import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/common/constants/colors.dart';
import 'package:on_a_trip/common/helper/image_picker_class.dart';
import 'package:on_a_trip/common/helper/utils.dart';
import 'package:on_a_trip/common/widgets/button_loading_indicator.dart';
import 'package:on_a_trip/common/widgets/custom_container.dart';
import 'package:on_a_trip/common/widgets/show_image_widget.dart';
import 'package:on_a_trip/features/destination_screen/presentation/provider/destination_screen_provider.dart';
import 'package:provider/provider.dart';

class TransporterAddPackageWidget extends StatefulWidget {
  const TransporterAddPackageWidget({super.key});

  @override
  State<TransporterAddPackageWidget> createState() => _TransporterAddPackageWidgetState();
}

class _TransporterAddPackageWidgetState extends State<TransporterAddPackageWidget> {
  final TextEditingController _packageTitleController = TextEditingController();
  final TextEditingController _noOfDaysController = TextEditingController();
  final TextEditingController _startsFromController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _perPriceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _cabNameController = TextEditingController();

  String? transportType;
  String? priceType;

  Future<void> _createPackage() async {
    try {
      final destinationProvider = context.read<DestinationScreenProvider>();
      if (destinationProvider.transporterPackageImages.isEmpty) {
        throw "Please select at least one image";
      }
      if (_packageTitleController.text.isEmpty) {
        throw "Please enter package title";
      }
      if (_noOfDaysController.text.isEmpty) {
        throw "Please enter no of days";
      }

      if (_startsFromController.text.isEmpty && destinationProvider.includeSightSeeingInHotelPackage) {
        throw "Please enter start from";
      }
      if (_cabNameController.text.isEmpty && destinationProvider.includeTransportInHotelPackage) {
        throw "Please enter cab name/model";
      }
      if (_perPriceController.text.isEmpty) {
        throw "Please enter price per person";
      }
      if (_descriptionController.text.isEmpty) {
        throw "Please enter description";
      }
      if (priceType == null) {
        throw "Please select price type";
      }

      final images = destinationProvider.transporterPackageImages;

      Map<String, dynamic> params = {
        'type': 'addTransport',
        'price_per': priceType,
        'includes[]': 'transport',
        'transport_type': transportType,
        'price': _perPriceController.text,
        'no_of_days': _noOfDaysController.text,
        'start_from[]': _startsFromController.text,
        'destination': _destinationController.text,
        'description': _descriptionController.text,
        'package_title': _packageTitleController.text,
      };

      await destinationProvider.addPackage(
        body: params,
        images: images,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<DestinationScreenProvider>(
        builder: (context, destinationScreenProvider, child) {
          return Column(
            children: [
              CachedNetworkImage(
                imageUrl: "https://manalitaxi.in//wp-content/uploads/2023/02/Manali-Taxi-Service-343543.jpg",
                imageBuilder: (context, imageProvider) => Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, imageProvider) => Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: CustomColors.cardColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              CustomContainer(
                child: Consumer<DestinationScreenProvider>(
                  builder: (context, destinationScreenProvider, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        (destinationScreenProvider.transporterPackageImages.isNotEmpty)
                            ? ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) => ShowImageWidget(
                                  image: destinationScreenProvider.transporterPackageImages[index],
                                  onTap: () {
                                    destinationScreenProvider.removeTransporterPackageImage(index);
                                  },
                                ),
                                itemCount: destinationScreenProvider.transporterPackageImages.length,
                              )
                            : SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    try {
                                      List<File> pickedFile;
                                      pickedFile = await FetchImage.pickMultipleImage();

                                      destinationScreenProvider.transporterPackageImages = pickedFile;
                                    } catch (e) {
                                      Utils.showSnackBar(context, content: e.toString());
                                    }
                                  },
                                  child: const Icon(
                                    size: 18,
                                    Icons.add_a_photo,
                                  ),
                                ),
                              ),
                        SizedBox(height: 12.h),
                        TextFormField(
                          controller: _packageTitleController,
                          decoration: const InputDecoration(
                            labelText: "Package Title",
                            prefixIcon: Icon(Icons.tour_outlined),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        TextFormField(
                          controller: _noOfDaysController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: "No. of Days",
                            prefixIcon: Icon(Icons.timer_outlined),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        TextFormField(
                          controller: _startsFromController,
                          decoration: const InputDecoration(
                            labelText: "Starts From",
                            prefixIcon: Icon(Icons.place_outlined),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        TextFormField(
                          controller: _destinationController,
                          decoration: const InputDecoration(
                            labelText: "Destination",
                            prefixIcon: Icon(Icons.place_outlined),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        const Text(
                          "Includes",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: CustomColors.titleColor,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            Checkbox(
                              value: destinationScreenProvider.includeSightSeeingInHotelPackage,
                              activeColor: CustomColors.primaryColor,
                              onChanged: (newVal) {
                                destinationScreenProvider.includeSightSeeingInHotelPackage = newVal!;
                              },
                            ),
                            const Text("Local Sightseeing"),
                          ],
                        ),
                        // (destinationScreenProvider.includeSightSeeingInHotelPackage)
                        //     ? Column(
                        //         children: [
                        //           SizedBox(height: 12.h),
                        //           TextFormField(
                        //             controller: _startsFromController,
                        //             decoration: const InputDecoration(
                        //               labelText: "Starts From",
                        //               prefixIcon: Icon(Icons.place_outlined),
                        //             ),
                        //           ),
                        //         ],
                        //       )
                        //     : const SizedBox.shrink(),
                        SizedBox(height: 12.h),
                        DropdownButtonFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.drive_eta_outlined),
                            labelText: "Transportation Type",
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: "hatchback",
                              child: Text("Hatch Back"),
                            ),
                            DropdownMenuItem(
                              value: "sedan",
                              child: Text("Sedan"),
                            ),
                            DropdownMenuItem(
                              value: "muv",
                              child: Text("MUV"),
                            ),
                            DropdownMenuItem(
                              value: "suv",
                              child: Text("SUV"),
                            ),
                            DropdownMenuItem(
                              value: "temp_traveller",
                              child: Text("Tempo Traveller"),
                            ),
                            DropdownMenuItem(
                              value: "train",
                              child: Text("Train"),
                            ),
                            DropdownMenuItem(
                              value: "plain",
                              child: Text("Airplane"),
                            ),
                            DropdownMenuItem(
                              value: "bus",
                              child: Text("Bus"),
                            ),
                          ],
                          onChanged: (newVal) {
                            transportType = newVal;
                          },
                        ),
                        SizedBox(height: 12.h),
                        DropdownButtonFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.drive_eta_outlined),
                            labelText: "Price Type",
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: "per_person",
                              child: Text("Per Person"),
                            ),
                            DropdownMenuItem(
                              value: "per_couple",
                              child: Text("Per Couple"),
                            ),
                          ],
                          onChanged: (newVal) {
                            priceType = newVal;
                          },
                        ),
                        SizedBox(height: 12.h),
                        TextFormField(
                          controller: _cabNameController,
                          decoration: const InputDecoration(
                            labelText: "Cab Name/Model",
                            prefixIcon: Icon(Icons.car_rental_outlined),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        TextFormField(
                          controller: _perPriceController,
                          decoration: const InputDecoration(
                            labelText: "Price",
                            prefixIcon: Icon(Icons.price_change_outlined),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        TextFormField(
                          minLines: 3,
                          maxLines: null,
                          controller: _descriptionController,
                          decoration: const InputDecoration(
                            labelText: "Package Description",
                            prefixIcon: Icon(Icons.description_outlined),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              try {
                                await _createPackage();
                                Utils.showSnackBar(context, content: "Package created successfully");
                              } catch (e) {
                                Utils.showSnackBar(context, content: e.toString());
                              }
                            },
                            child: (destinationScreenProvider.isLoading) ? const ButtonLoadingIndicator() : const Text("Create Package"),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
