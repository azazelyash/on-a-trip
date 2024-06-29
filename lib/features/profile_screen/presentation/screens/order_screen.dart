import 'package:flutter/material.dart';
import 'package:on_a_trip/common/constants/colors.dart';
import 'package:on_a_trip/common/constants/spaces.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/common/widgets/back_button_appbar.dart';
import 'package:on_a_trip/features/profile_screen/presentation/widgets/cancelled_order_tab.dart';
import 'package:on_a_trip/features/profile_screen/presentation/widgets/completed_order_tab.dart';
import 'package:on_a_trip/features/profile_screen/presentation/widgets/processing_order_tab.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  static const List<Widget> _tabs = [
    ProcessingOrderTab(),
    CompletedOrderTab(),
    CancelledOrderTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Spaces.defaultVerticalPadding,
            horizontal: Spaces.defaultHorizontalPadding,
          ),
          child: Column(
            children: [
              const BackButtonAppBar(),
              SizedBox(height: 20.h),
              const Text(
                "Orders",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.h),
              TabBar(
                controller: _tabController,
                onTap: (index) {
                  _tabController.animateTo(
                    index,
                    curve: Curves.easeIn,
                    duration: const Duration(milliseconds: 200),
                  );
                },
                tabAlignment: TabAlignment.fill,
                labelPadding: EdgeInsets.symmetric(vertical: 2.h),
                labelColor: CustomColors.primaryColor,
                unselectedLabelColor: CustomColors.highlightText,
                indicatorColor: CustomColors.primaryColor,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: const [
                  Tab(text: "Processing"),
                  Tab(text: "Completed"),
                  Tab(text: "Cancelled"),
                ],
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: _tabs,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
