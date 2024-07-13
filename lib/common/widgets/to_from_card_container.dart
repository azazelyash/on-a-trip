import 'package:flutter/material.dart';
import 'package:on_a_trip/common/constants/colors.dart';

class ToFromCardContainer extends StatelessWidget {
  const ToFromCardContainer({
    super.key,
    required this.startTitle,
    required this.destinationTitle,
    required this.startValue,
    required this.destinationValue,
  });

  final String startTitle;
  final String startValue;
  final String destinationTitle;
  final String destinationValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          color: CustomColors.primaryColor.withOpacity(0.1),
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  startTitle,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: CustomColors.highlightText,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  startValue,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: CustomColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 48,
            child: VerticalDivider(
              color: CustomColors.primaryColor.withOpacity(0.1),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  destinationTitle,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: CustomColors.highlightText,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  destinationValue,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: CustomColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
