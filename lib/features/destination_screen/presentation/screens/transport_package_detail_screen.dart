import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/common/constants/colors.dart';
import 'package:on_a_trip/common/constants/spaces.dart';
import 'package:on_a_trip/common/helper/image_list_generater.dart';
import 'package:on_a_trip/common/widgets/back_button_appbar.dart';
import 'package:on_a_trip/common/widgets/card_title_widget.dart';
import 'package:on_a_trip/common/widgets/custom_container.dart';
import 'package:on_a_trip/common/widgets/image_slider_widget.dart';
import 'package:on_a_trip/common/widgets/to_from_card_container.dart';
import 'package:on_a_trip/features/bidding_screen/presentation/screens/bidding_details_screen.dart';
import 'package:on_a_trip/features/destination_screen/data/models/transport_package_model.dart';
import 'package:on_a_trip/gen/assets.gen.dart';

class TransportPackageDetailScreen extends StatefulWidget {
  const TransportPackageDetailScreen({super.key, required this.transportPackageModel});

  final TransportPackageModel transportPackageModel;

  @override
  State<TransportPackageDetailScreen> createState() => _TransportPackageDetailScreenState();
}

class _TransportPackageDetailScreenState extends State<TransportPackageDetailScreen> {
  final PageController _pageController = PageController();

  List<Widget> imageSliders = [];

  @override
  void initState() {
    imageSliders = ImageListGenerater.generateImages(widget.transportPackageModel.image);
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
                "Transport Package Details",
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
                          value: widget.transportPackageModel.title!,
                        ),
                        SizedBox(height: 8.h),
                        AdditionalnformationWidget(
                          title: "Duration",
                          value: widget.transportPackageModel.noOfDays!.toString(),
                        ),
                        SizedBox(height: 8.h),
                        AdditionalnformationWidget(
                          title: "Description",
                          value: widget.transportPackageModel.description ?? 'N/A',
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    ToFromCardContainer(
                      startTitle: "Boarding",
                      destinationTitle: "Destination",
                      startValue: widget.transportPackageModel.startFrom?.join(', ') ?? 'N/A',
                      destinationValue: widget.transportPackageModel.destination ?? 'N/A',
                    ),
                    SizedBox(height: 20.h),
                    CardTitleWidget(
                      image: Assets.images.parking.image(height: 64),
                      title: "Transport Details",
                    ),
                    SizedBox(height: 20.h),
                    CardChildrenWidget(
                      children: [
                        AdditionalnformationWidget(
                          title: "Transport Type",
                          value: widget.transportPackageModel.transportType ?? 'N/A',
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    CardTitleWidget(
                      image: Assets.images.accessibilty.image(height: 64),
                      title: "Price Details",
                    ),
                    SizedBox(height: 20.h),
                    CardChildrenWidget(
                      children: [
                        AdditionalnformationWidget(
                          title: "Active",
                          value: widget.transportPackageModel.active! == 1 ? 'Yes' : 'No',
                        ),
                        SizedBox(height: 8.h),
                        AdditionalnformationWidget(
                          title: "Price Type",
                          value: widget.transportPackageModel.pricePer ?? 'N/A',
                        ),
                        SizedBox(height: 8.h),
                        AdditionalnformationWidget(
                          title: "Price",
                          value: widget.transportPackageModel.price?.toString() ?? 'N/A',
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

class CardChildrenWidget extends StatelessWidget {
  const CardChildrenWidget({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: children,
      ),
    );
  }
}
