import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/common/constants/spaces.dart';
import 'package:on_a_trip/common/helper/image_list_generater.dart';
import 'package:on_a_trip/common/widgets/back_button_appbar.dart';
import 'package:on_a_trip/common/widgets/custom_container.dart';
import 'package:on_a_trip/common/widgets/image_slider_widget.dart';
import 'package:on_a_trip/features/bidding_screen/presentation/screens/bidding_details_screen.dart';
import 'package:on_a_trip/features/destination_screen/data/models/hotel_package_model.dart';

class HotelDetailsScreen extends StatefulWidget {
  const HotelDetailsScreen({super.key, required this.hotelPackageModel});

  final HotelPackageModel hotelPackageModel;

  @override
  State<HotelDetailsScreen> createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen> {
  final PageController _pageController = PageController();

  List<Widget> imageSliders = [];

  @override
  void initState() {
    imageSliders = ImageListGenerater.generateImages(widget.hotelPackageModel.image);
    super.initState();
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackButtonAppBar(),
              SizedBox(height: 20.h),
              const Text(
                "Package Details",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.h),
              (imageSliders.isNotEmpty)
                  ? ImageSliderWidget(
                      pageController: _pageController,
                      imageSliders: imageSliders,
                    )
                  : Container(
                      height: 100.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text("No Image Available"),
                      ),
                    ),
              SizedBox(height: 20.h),
              CustomContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hotel Details",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    const Divider(),
                    SizedBox(height: 4.h),
                    AdditionalnformationWidget(
                      title: "Title",
                      value: widget.hotelPackageModel.title ?? 'N/A',
                    ),
                    SizedBox(height: 8.h),
                    AdditionalnformationWidget(
                      title: "Number of Days",
                      value: widget.hotelPackageModel.noOfDays?.toString() ?? 'N/A',
                    ),
                    SizedBox(height: 8.h),
                    AdditionalnformationWidget(
                      title: "Address",
                      value: widget.hotelPackageModel.address ?? 'N/A',
                    ),
                    SizedBox(height: 8.h),
                    AdditionalnformationWidget(
                      title: "Includes",
                      value: widget.hotelPackageModel.includes?.join(', ') ?? 'N/A',
                    ),
                    SizedBox(height: 8.h),
                    AdditionalnformationWidget(
                      title: "Plan Type",
                      value: widget.hotelPackageModel.planType ?? 'N/A',
                    ),
                    SizedBox(height: 8.h),
                    AdditionalnformationWidget(
                      title: "Start From",
                      value: widget.hotelPackageModel.startFrom?.join(', ') ?? 'N/A',
                    ),
                    SizedBox(height: 8.h),
                    AdditionalnformationWidget(
                      title: "Transport Type",
                      value: widget.hotelPackageModel.transportType ?? 'N/A',
                    ),
                    SizedBox(height: 8.h),
                    AdditionalnformationWidget(
                      title: "Cab Name",
                      value: widget.hotelPackageModel.cabName ?? 'N/A',
                    ),
                    SizedBox(height: 8.h),
                    AdditionalnformationWidget(
                      title: "Description",
                      value: widget.hotelPackageModel.description ?? 'N/A',
                    ),
                    SizedBox(height: 8.h),
                    AdditionalnformationWidget(
                      title: "Price",
                      value: widget.hotelPackageModel.price?.toString() ?? 'N/A',
                    ),
                    SizedBox(height: 8.h),
                    AdditionalnformationWidget(
                      title: "Price Per",
                      value: widget.hotelPackageModel.pricePer ?? 'N/A',
                    ),
                    SizedBox(height: 8.h),
                    AdditionalnformationWidget(
                      title: "Active",
                      value: widget.hotelPackageModel.active! == 1 ? 'Yes' : 'No',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
