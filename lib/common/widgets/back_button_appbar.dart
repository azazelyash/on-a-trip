import 'package:flutter/material.dart';
import 'package:on_a_trip/common/constants/colors.dart';

class BackButtonAppBar extends StatelessWidget {
  const BackButtonAppBar({
    super.key,
  });

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
          color: CustomColors.highlightText,
          visualDensity: VisualDensity.compact,
          icon: const Icon(Icons.chevron_left),
        ),
      ],
    );
  }
}
