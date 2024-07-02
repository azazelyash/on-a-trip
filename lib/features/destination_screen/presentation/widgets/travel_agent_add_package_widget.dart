import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/common/constants/colors.dart';
import 'package:on_a_trip/common/widgets/custom_container.dart';
import 'package:on_a_trip/features/destination_screen/presentation/provider/destination_screen_provider.dart';
import 'package:provider/provider.dart';

class TravelAgentAddPackageWidget extends StatefulWidget {
  const TravelAgentAddPackageWidget({super.key});

  @override
  State<TravelAgentAddPackageWidget> createState() => _TravelAgentAddPackageWidgetState();
}

class _TravelAgentAddPackageWidgetState extends State<TravelAgentAddPackageWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: "https://blog.thomascook.in/wp-content/uploads/2017/01/Santorini-Greece.jpg",
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
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Package Title",
                        prefixIcon: Icon(Icons.tour_outlined),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "No. of Days",
                        prefixIcon: Icon(Icons.timer_outlined),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Destination",
                        prefixIcon: Icon(Icons.place_outlined),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.hotel_class_outlined),
                        labelText: "Hotel Catergory",
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: "Budget",
                          child: Text("Budget"),
                        ),
                        DropdownMenuItem(
                          value: "3 Star",
                          child: Text("3 Star"),
                        ),
                        DropdownMenuItem(
                          value: "4 Star",
                          child: Text("4 Star"),
                        ),
                        DropdownMenuItem(
                          value: "5 Star",
                          child: Text("5 Star"),
                        ),
                      ],
                      onChanged: (newVal) {},
                    ),
                    SizedBox(height: 12.h),
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.event_outlined),
                        labelText: "Plan Type",
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: "ep",
                          child: Text("EP"),
                        ),
                        DropdownMenuItem(
                          value: "cp",
                          child: Text("CP"),
                        ),
                        DropdownMenuItem(
                          value: "MAP",
                          child: Text("MAP"),
                        ),
                        DropdownMenuItem(
                          value: "AP",
                          child: Text("AP"),
                        ),
                      ],
                      onChanged: (newVal) {},
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
                        Expanded(
                          child: Row(
                            children: [
                              Checkbox(
                                value: destinationScreenProvider.includeTransportInHotelPackage,
                                activeColor: CustomColors.primaryColor,
                                onChanged: (newVal) {
                                  destinationScreenProvider.includeTransportInHotelPackage = newVal!;
                                },
                              ),
                              const Text("Transportation"),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
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
                        )
                      ],
                    ),
                    (destinationScreenProvider.includeSightSeeingInHotelPackage)
                        ? Column(
                            children: [
                              SizedBox(height: 12.h),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: "Starts From",
                                  prefixIcon: Icon(Icons.place_outlined),
                                ),
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                    (destinationScreenProvider.includeTransportInHotelPackage)
                        ? Column(
                            children: [
                              SizedBox(height: 12.h),
                              DropdownButtonFormField(
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.drive_eta_outlined),
                                  labelText: "Transportation Type",
                                ),
                                items: const [
                                  DropdownMenuItem(
                                    value: "Hatch Back",
                                    child: Text("Hatch Back"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Sedan",
                                    child: Text("Sedan"),
                                  ),
                                  DropdownMenuItem(
                                    value: "MUV",
                                    child: Text("MUV"),
                                  ),
                                  DropdownMenuItem(
                                    value: "SUV",
                                    child: Text("SUV"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Tempo Traveller",
                                    child: Text("Tempo Traveller"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Bus",
                                    child: Text("Bus"),
                                  ),
                                ],
                                onChanged: (newVal) {},
                              ),
                              SizedBox(height: 12.h),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: "Cab Name/Model",
                                  prefixIcon: Icon(Icons.car_rental_outlined),
                                ),
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                    SizedBox(height: 12.h),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Price Per Person",
                        prefixIcon: Icon(Icons.price_change_outlined),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.group_outlined),
                        labelText: "Couple",
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: "Yes",
                          child: Text("Yes"),
                        ),
                        DropdownMenuItem(
                          value: "No",
                          child: Text("No"),
                        ),
                      ],
                      onChanged: (newVal) {},
                    ),
                    SizedBox(height: 12.h),
                    TextFormField(
                      minLines: 3,
                      maxLines: null,
                      decoration: const InputDecoration(
                        labelText: "Package Description",
                        prefixIcon: Icon(Icons.description_outlined),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("Create Package"),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
