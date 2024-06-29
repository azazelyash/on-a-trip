import 'package:flutter/material.dart';
import 'package:on_a_trip/gen/assets.gen.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Assets.images.logo.image(width: 120),
        IconButton(
          onPressed: () {},
          splashRadius: 24,
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.menu),
          visualDensity: VisualDensity.compact,
        ),
      ],
    );
  }
}
