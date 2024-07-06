import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class MediaSourcePopup extends StatelessWidget {
  const MediaSourcePopup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(20),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Pick Source",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop(ImageSource.camera);
                  },
                  icon: const Icon(Icons.camera_enhance_outlined),
                  label: const Text("Camera"),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop(ImageSource.gallery);
                  },
                  icon: const Icon(Icons.sd_card_outlined),
                  label: const Text("Gallery"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
