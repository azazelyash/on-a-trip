import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/common/constants/colors.dart';
import 'package:on_a_trip/features/notification_screen/notification_detail_screen.dart';
import 'package:on_a_trip/gen/assets.gen.dart';

class NotificationTileWidget extends StatelessWidget {
  const NotificationTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const NotificationDetailScreen()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 10),
        height: 100,
        decoration: const BoxDecoration(color: Color(0xFFF4F3FD), borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              height: 70,
              width: 70,
              decoration: const BoxDecoration(
                color: Color(0xFFFFEBF0),
                borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
              ),
              child: Assets.images.breakfast.image(),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "New Proposal from Anurag ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: CustomColors.titleColor,
                  ),
                ),
                SizedBox(height: 4.h),
                const Text(
                  "Rs. 12,000",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: CustomColors.highlightText,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "14 mins ago",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: CustomColors.primaryColor.withOpacity(0.9),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
