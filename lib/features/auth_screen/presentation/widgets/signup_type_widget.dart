import 'package:flutter/material.dart';
import 'package:on_a_trip/common/constants/colors.dart';

class SignUpTypeWidget extends StatelessWidget {
  const SignUpTypeWidget({
    super.key,
    this.onTap,
    required this.image,
    required this.title,
  });

  final VoidCallback? onTap;
  final Widget image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: CustomColors.primaryColor.withOpacity(0.1),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                image,
                const SizedBox(height: 16),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: CustomColors.primaryColor,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            )
          ],
        ),
      ),
    );
  }
}
