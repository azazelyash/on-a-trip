import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/common/constants/colors.dart';
import 'package:on_a_trip/common/constants/spaces.dart';
import 'package:on_a_trip/common/helper/image_list_generater.dart';
import 'package:on_a_trip/common/widgets/back_button_appbar.dart';
import 'package:on_a_trip/common/widgets/card_title_widget.dart';
import 'package:on_a_trip/common/widgets/custom_container.dart';
import 'package:on_a_trip/common/widgets/image_slider_widget.dart';
import 'package:on_a_trip/features/bidding_screen/presentation/screens/bidding_details_screen.dart';
import 'package:on_a_trip/features/destination_screen/data/models/holiday_package_model.dart';
import 'package:on_a_trip/features/destination_screen/presentation/screens/transport_package_detail_screen.dart';
import 'package:on_a_trip/gen/assets.gen.dart';

class HolidayPackageDetailScreen extends StatefulWidget {
  const HolidayPackageDetailScreen({
    super.key,
    required this.holidayPackageModel,
  });

  final HolidayPackageModel holidayPackageModel;

  @override
  State<HolidayPackageDetailScreen> createState() => _HolidayPackageDetailScreenState();
}

class _HolidayPackageDetailScreenState extends State<HolidayPackageDetailScreen> {
  final PageController _pageController = PageController();

  List<Widget> imageSliders = [];

  @override
  void initState() {
    imageSliders = ImageListGenerater.generateImages(widget.holidayPackageModel.images);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red.shade700,
                  side: BorderSide(color: Colors.red.shade700),
                ),
                child: const Text("Delete"),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Edit"),
              ),
            ),
          ],
        ),
      ),
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
                "Holiday Package Details",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.primaryColor,
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
                    CardTitleWidget(
                      image: Assets.images.accessibilty.image(height: 64),
                      title: "Package Details",
                    ),
                    SizedBox(height: 20.h),
                    CardChildrenWidget(
                      children: [
                        AdditionalnformationWidget(
                          title: "Package Name",
                          value: widget.holidayPackageModel.title!,
                        ),
                        SizedBox(height: 8.h),
                        AdditionalnformationWidget(
                          title: "Duration",
                          value: widget.holidayPackageModel.noOfDays != null ? widget.holidayPackageModel.noOfDays.toString() : 'N/A',
                        ),
                        SizedBox(height: 8.h),
                        AdditionalnformationWidget(
                          title: "Plan Type",
                          value: widget.holidayPackageModel.planType ?? 'N/A',
                        ),
                        SizedBox(height: 8.h),
                        AdditionalnformationWidget(
                          title: "Start From",
                          value: widget.holidayPackageModel.startFrom!.join(', '),
                        ),
                        SizedBox(height: 8.h),
                        AdditionalnformationWidget(
                          title: "Includes",
                          value: widget.holidayPackageModel.include?.join(', ') ?? 'N/A',
                        ),
                        SizedBox(height: 8.h),
                        AdditionalnformationWidget(
                          title: "Description",
                          value: widget.holidayPackageModel.description ?? 'N/A',
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    CardTitleWidget(
                      image: Assets.images.restaurant.image(height: 64),
                      title: "Hotel Details",
                    ),
                    SizedBox(height: 20.h),
                    CardChildrenWidget(
                      children: [
                        AdditionalnformationWidget(
                          title: "Hotel Category",
                          value: widget.holidayPackageModel.hotelCat!,
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    CardTitleWidget(
                      image: Assets.images.parking.image(height: 64),
                      title: "Transport Details",
                    ),
                    SizedBox(height: 20.h),
                    CardChildrenWidget(
                      children: [
                        AdditionalnformationWidget(
                          title: "Transport Type",
                          value: widget.holidayPackageModel.transportType ?? 'N/A',
                        ),
                        SizedBox(height: 8.h),
                        AdditionalnformationWidget(
                          title: "Transport Name",
                          value: widget.holidayPackageModel.cabName ?? 'N/A',
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    CardTitleWidget(
                      image: Assets.images.accessibilty.image(height: 64),
                      title: "Price Details",
                    ),
                    SizedBox(height: 20.h),
                    CardChildrenWidget(
                      children: [
                        AdditionalnformationWidget(
                          title: "Price Type",
                          value: widget.holidayPackageModel.pricePer ?? 'N/A',
                        ),
                        SizedBox(height: 8.h),
                        AdditionalnformationWidget(
                          title: "Price",
                          value: widget.holidayPackageModel.price.toString(),
                        ),
                        SizedBox(height: 8.h),
                        AdditionalnformationWidget(
                          title: "Active",
                          value: widget.holidayPackageModel.active == 1 ? 'Yes' : 'No',
                        ),
                      ],
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
