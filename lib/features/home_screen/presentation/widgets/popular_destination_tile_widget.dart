import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/common/constants/colors.dart';
import 'package:on_a_trip/features/destination_screen/presentation/screens/proposal_detail_screen.dart';

class PopularDestinationTileWidget extends StatelessWidget {
  const PopularDestinationTileWidget({
    super.key,
    this.onTap,
    required this.imageUrl,
    required this.title,
    required this.locationSubtitle,
  });

  final String imageUrl;
  final String title;
  final VoidCallback? onTap;
  final String locationSubtitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // TODO: Add onTap
      onTap: onTap ??
          () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ProposalDetailScreen()),
            );
          },
      child: Padding(
        padding: EdgeInsets.only(right: 18.h),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          imageBuilder: (context, imageProvider) => Container(
            width: 150,
            height: 200,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.85),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: CustomColors.titleColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 12,
                              color: CustomColors.primaryColor,
                            ),
                            SizedBox(width: 4),
                            Text(
                              "South Tyrol, Italy",
                              style: TextStyle(
                                color: CustomColors.primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          placeholder: (context, url) => Container(
            width: 150,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade200,
            ),
            child: const Center(
              child: CircularProgressIndicator(
                color: CustomColors.primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
