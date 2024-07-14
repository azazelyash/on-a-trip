import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/common/constants/colors.dart';
import 'package:on_a_trip/common/constants/spaces.dart';
import 'package:on_a_trip/common/widgets/back_button_appbar.dart';
import 'package:on_a_trip/common/widgets/custom_container.dart';

class NotificationDetailScreen extends StatelessWidget {
  const NotificationDetailScreen({
    super.key,
    required this.title,
    required this.createdAt,
    required this.imageUrl,
    required this.description,
  });

  final String title;
  final String createdAt;
  final String description;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Container(
      //   width: double.infinity,
      //   padding: const EdgeInsets.all(10),
      //   child: ElevatedButton(
      //     onPressed: () {},
      //     style: ElevatedButton.styleFrom(
      //       elevation: 0,
      //       backgroundColor: CustomColors.cardColor,
      //       foregroundColor: CustomColors.primaryColor,
      //     ),
      //     child: const Text('View'),
      //   ),
      // ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Spaces.defaultHorizontalPadding,
            vertical: Spaces.defaultVerticalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const BackButtonAppBar(),
              SizedBox(height: 24.h),
              const Text(
                "Notification Details",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.titleColor,
                ),
              ),
              SizedBox(height: 16.h),
              CachedNetworkImage(
                imageUrl: imageUrl,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    height: 240.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFEBF0),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                  );
                },
                placeholder: (context, url) => Container(
                  height: 240.h,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFEBF0),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  height: 240.h,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFEBF0),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: CustomContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.titleColor,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        createdAt,
                        style: const TextStyle(
                          color: CustomColors.highlightText,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        description,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 14,
                          color: CustomColors.titleColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
