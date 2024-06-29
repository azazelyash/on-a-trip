import 'package:flutter/material.dart';
import 'package:on_a_trip/features/profile_screen/presentation/widgets/order_screen_tile.dart';

class CompletedOrderTab extends StatelessWidget {
  const CompletedOrderTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          OrderScreenTile(),
        ],
      ),
    );
  }
}
