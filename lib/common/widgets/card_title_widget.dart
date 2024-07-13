import 'package:flutter/material.dart';
import 'package:on_a_trip/common/constants/colors.dart';

class CardTitleWidget extends StatelessWidget {
  const CardTitleWidget({
    super.key,
    required this.title,
    required this.image,
  });

  final String title;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: CustomColors.cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          image,
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: CustomColors.highlightText,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
