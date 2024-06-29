import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/features/profile_screen/presentation/widgets/order_screen_tile.dart';

class CancelledOrderTab extends StatelessWidget {
  const CancelledOrderTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const OrderScreenTile(),
          SizedBox(height: 16.h),
          const OrderScreenTile(),
          SizedBox(height: 16.h),
          const OrderScreenTile(),
          SizedBox(height: 16.h),
          const OrderScreenTile(),
        ],
      ),
    );
  }
}
