import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/common/constants/colors.dart';
import 'package:on_a_trip/common/widgets/custom_container.dart';

class OrderScreenTile extends StatelessWidget {
  const OrderScreenTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Booking No. #123",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    const Text(
                      "Working Time",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    const Text(
                      "Mon, 22 May, 24 - 12:34 PM",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: CustomColors.highlightText,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: "https://blog.thomascook.in/wp-content/uploads/2017/01/Santorini-Greece.jpg",
                  imageBuilder: (context, imageProvide) => Container(
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvide,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Container(
                    height: 100,
                    decoration: const BoxDecoration(
                      color: CustomColors.highlightText,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          const Text(
            "Location",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 4.h),
          const Text(
            "Room 123, Brooklyn St, Kepler District",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: CustomColors.highlightText,
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Container(
                height: 12,
                width: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CustomColors.primaryColor.withOpacity(0.7),
                ),
              ),
              Expanded(
                child: Container(
                  height: 2,
                  decoration: BoxDecoration(
                    color: CustomColors.primaryColor.withOpacity(0.3),
                  ),
                ),
              ),
              Container(
                height: 12,
                width: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CustomColors.primaryColor.withOpacity(0.3),
                ),
              ),
              Expanded(
                child: Container(
                  height: 2,
                  decoration: BoxDecoration(
                    color: CustomColors.primaryColor.withOpacity(0.3),
                  ),
                ),
              ),
              Container(
                height: 12,
                width: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CustomColors.primaryColor.withOpacity(0.3),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: CustomColors.cardColor,
                foregroundColor: CustomColors.primaryColor,
              ),
              child: const Text("View Details"),
            ),
          )
        ],
      ),
    );
  }
}
