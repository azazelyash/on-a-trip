import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/features/profile_screen/presentation/widgets/order_screen_tile.dart';

class ProcessingOrderTab extends StatelessWidget {
  const ProcessingOrderTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const OrderScreenTile(),
          SizedBox(height: 12.h),
          const OrderScreenTile(),
        ],
      ),
    );
  }
}