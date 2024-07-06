import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowImageWidget extends StatelessWidget {
  const ShowImageWidget({
    super.key,
    required this.image,
    required this.onTap,
  });

  final File image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.file(
          image,
          height: 200.h,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                splashRadius: 20,
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.delete),
                color: Colors.white,
                onPressed: onTap,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
