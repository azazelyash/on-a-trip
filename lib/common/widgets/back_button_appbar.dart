import 'package:flutter/material.dart';
import 'package:on_a_trip/common/constants/colors.dart';

class BackButtonAppBar extends StatelessWidget {
  const BackButtonAppBar({
    super.key,
    this.title,
    this.iconColor,
  });

  final String? title;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          splashRadius: 20,
          padding: EdgeInsets.zero,
          color: iconColor ?? CustomColors.highlightText,
          visualDensity: VisualDensity.compact,
          icon: const Icon(Icons.chevron_left),
        ),
        const Spacer(),
        title != null
            ? Text(
                title!,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: iconColor ?? CustomColors.titleColor,
                ),
              )
            : const SizedBox.shrink(),
        const Spacer(),
        const SizedBox(width: 40),
      ],
    );
  }
}
