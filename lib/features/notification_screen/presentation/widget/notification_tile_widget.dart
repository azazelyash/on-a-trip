import 'package:flutter/material.dart';
import 'package:on_a_trip/common/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NotificationTileWidget extends StatelessWidget {
  const NotificationTileWidget({
    super.key,
    required this.onTap,
    required this.title,
    required this.subTitle,
    required this.subSubTitle,
    required this.imageUrl,
    required this.seen,
  });

  final VoidCallback onTap;
  final String title;
  final String subTitle;
  final String subSubTitle;
  final String imageUrl;
  final bool seen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: const BoxDecoration(
          color: Color(0xFFF4F3FD),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              imageBuilder: (context, imageProvider) {
                return Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFEBF0),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(6),
                      bottomLeft: Radius.circular(6),
                      bottomRight: Radius.circular(6),
                    ),
                  ),
                );
              },
              placeholder: (context, url) => Container(
                height: 70,
                width: 70,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFEBF0),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(6),
                    bottomLeft: Radius.circular(6),
                    bottomRight: Radius.circular(6),
                  ),
                ),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                height: 70,
                width: 70,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFEBF0),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(6),
                    bottomLeft: Radius.circular(6),
                    bottomRight: Radius.circular(6),
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
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: CustomColors.titleColor,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subTitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                      color: CustomColors.highlightText,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subSubTitle,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: CustomColors.primaryColor.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
            (seen)
                ? const SizedBox()
                : Container(
                    height: 10,
                    width: 10,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                      color: CustomColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
