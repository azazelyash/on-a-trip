import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageListGenerater {
  ImageListGenerater._();

  static List<Widget> generateImages(List<String>? images) {
    if (images != null) {
      log('images: $images');
      return List.generate(
        images.length,
        (index) {
          return CachedNetworkImage(
            imageUrl: images[index],
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => Container(
              height: 200.h,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        },
      ).toList();
    }
    return [];
  }
}
