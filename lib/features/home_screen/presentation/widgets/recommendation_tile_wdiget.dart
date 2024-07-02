import 'package:flutter/material.dart';
import 'package:on_a_trip/common/constants/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:on_a_trip/features/destination_screen/presentation/screens/proposal_detail_screen.dart';

class RecommendationTileWidget extends StatelessWidget {
  const RecommendationTileWidget({
    super.key,
    required this.imgUrl,
    required this.title,
    this.isLast = false,
  });

  final String imgUrl;
  final String title;
  final bool? isLast;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ProposalDetailScreen()),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: (isLast ?? false) ? 0 : 12.0),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: imgUrl,
              imageBuilder: (context, imageProvider) => Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => Container(
                width: 72,
                height: 72,
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
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: CustomColors.titleColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
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
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: Colors.yellow.shade700,
                      size: 18,
                    ),
                    Icon(
                      Icons.star_rounded,
                      color: Colors.yellow.shade700,
                      size: 18,
                    ),
                    Icon(
                      Icons.star_rounded,
                      color: Colors.yellow.shade700,
                      size: 18,
                    ),
                    Icon(
                      Icons.star_rounded,
                      color: Colors.yellow.shade700,
                      size: 18,
                    ),
                    Icon(
                      Icons.star_half_rounded,
                      color: Colors.yellow.shade700,
                      size: 18,
                    ),
                  ],
                ),
                const SizedBox(width: 6),
                const Text(
                  "4.5 of 5",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
