import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/common/constants/colors.dart';
import 'package:on_a_trip/common/widgets/custom_container.dart';
import 'package:on_a_trip/features/destination_screen/presentation/provider/destination_screen_provider.dart';
import 'package:on_a_trip/features/destination_screen/presentation/screens/proposal_detail_screen.dart';
import 'package:on_a_trip/gen/assets.gen.dart';
import 'package:provider/provider.dart';

class TransporterAddPackageWidget extends StatefulWidget {
  const TransporterAddPackageWidget({super.key});

  @override
  State<TransporterAddPackageWidget> createState() => _TransporterAddPackageWidgetState();
}

class _TransporterAddPackageWidgetState extends State<TransporterAddPackageWidget> {
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
                child: Column(
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
                        labelText: "Starts From",
                        prefixIcon: Icon(Icons.place_outlined),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    TextFormField(
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
                      minLines: 3,
                      maxLines: null,
                      decoration: const InputDecoration(
                        labelText: "Cab Name/Model",
                        prefixIcon: Icon(Icons.car_rental_outlined),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Price Per Person",
                        prefixIcon: Icon(Icons.price_change_outlined),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    TextFormField(
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
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
