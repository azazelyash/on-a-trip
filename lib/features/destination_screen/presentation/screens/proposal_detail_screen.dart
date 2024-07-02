import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/common/constants/colors.dart';
import 'package:on_a_trip/common/constants/spaces.dart';
import 'package:on_a_trip/common/widgets/back_button_appbar.dart';
import 'package:on_a_trip/common/widgets/custom_container.dart';
import 'package:on_a_trip/gen/assets.gen.dart';

class ProposalDetailScreen extends StatelessWidget {
  const ProposalDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Query"),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade500,
                ),
                child: const Text("Buy"),
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
            children: [
              const BackButtonAppBar(),
              SizedBox(height: 20.h),
              CustomContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CachedNetworkImage(
                            imageUrl: "https://blog.thomascook.in/wp-content/uploads/2017/01/Santorini-Greece.jpg",
                            imageBuilder: (context, imageProvider) => Container(
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            placeholder: (context, url) => Container(
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: CustomColors.highlightText,
                              ),
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Shimla",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: CustomColors.headingColor,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              const Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Duration:",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: CustomColors.titleColor,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "2 Days",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: CustomColors.titleColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4.h),
                              const Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Budget:",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: CustomColors.titleColor,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "\$ 499.99",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: CustomColors.titleColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    const Text(
                      "Hotel India",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.titleColor,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    const Text(
                      "C-8, Site-Iv, 2nd Cross Ave Rd, Surajpur - Kasna Rd, Greater Noida, Uttar Pradesh 201306•0120 451 7777",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: CustomColors.highlightText,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    const Text(
                      "Proposal",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.titleColor,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    const Text(
                      "Budegt: \$ 499.99",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: CustomColors.highlightText,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    const Text(
                      "For 1 Night and 2 Days",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: CustomColors.highlightText,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    const Text(
                      "Amenities",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.titleColor,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AmenitiesWidget(
                              title: "Restaurant",
                              image: Assets.images.restaurant.image(width: 56),
                            ),
                            SizedBox(height: 2.h),
                            AmenitiesWidget(
                              title: "Parking",
                              image: Assets.images.parking.image(width: 56),
                            ),
                            SizedBox(height: 2.h),
                            AmenitiesWidget(
                              title: "Free Wifi",
                              image: Assets.images.wifi.image(width: 56),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AmenitiesWidget(
                              title: "Breakfast",
                              image: Assets.images.breakfast.image(width: 56),
                            ),
                            SizedBox(height: 2.h),
                            AmenitiesWidget(
                              title: "Entertainmernt",
                              image: Assets.images.entertainmernt.image(width: 56),
                            ),
                            SizedBox(height: 2.h),
                            AmenitiesWidget(
                              title: "Accessibilty",
                              image: Assets.images.accessibilty.image(width: 56),
                            ),
                          ],
                        ),
                      ],
                    )
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

class AmenitiesWidget extends StatelessWidget {
  const AmenitiesWidget({
    super.key,
    required this.image,
    required this.title,
  });

  final Widget image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        image,
        SizedBox(
          width: 6.w,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: CustomColors.titleColor,
          ),
        ),
      ],
    );
  }
}
