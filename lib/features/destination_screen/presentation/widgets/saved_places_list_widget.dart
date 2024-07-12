import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/common/constants/colors.dart';

class SavedPlacesListWidget extends StatelessWidget {
  const SavedPlacesListWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onTap,
    required this.locationSubtitle,
  });

  final String imageUrl;
  final String title;
  final VoidCallback onTap;
  final String locationSubtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 18.h),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (context, imageProvider) => Container(
          width: double.infinity,
          height: 200,
          padding: const EdgeInsets.all(12),
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
                child: InkWell(
                  onTap: onTap,
                  borderRadius: BorderRadius.circular(10),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    tileColor: Colors.white.withOpacity(0.85),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          size: 16,
                          Icons.location_on_outlined,
                          color: CustomColors.primaryColor,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          locationSubtitle,
                          style: const TextStyle(
                            fontSize: 16,
                            color: CustomColors.primaryColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    trailing: const Icon(Icons.chevron_right_rounded),
                  ),
                ),
              ),
            ],
          ),
        ),
        placeholder: (context, url) => Container(
          width: double.infinity,
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
    );
  }
}
