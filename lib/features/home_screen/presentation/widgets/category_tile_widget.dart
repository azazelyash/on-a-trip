import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/common/constants/colors.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.onTap,
    required this.image,
    required this.title,
    required this.icon,
  });

  final VoidCallback onTap;
  final String title;
  final IconData icon;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CustomColors.cardColor,
                image: DecorationImage(
                  image: image,
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(0.2),
                ),
                child: Center(
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: CustomColors.titleColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
