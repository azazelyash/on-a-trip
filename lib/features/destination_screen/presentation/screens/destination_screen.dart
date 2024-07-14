import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/features/destination_screen/presentation/widgets/add_package_widget.dart';
import 'package:on_a_trip/features/destination_screen/presentation/widgets/proposal_widget.dart';

import '../widgets/our_package_widget.dart';
import '../../../../common/constants/colors.dart';
import '../../../../common/constants/spaces.dart';
import '../../../../common/widgets/custom_appbar.dart';
import '../../../../common/widgets/custom_search_bar.dart';

class DestinationScreen extends StatefulWidget {
  const DestinationScreen({super.key});

  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> with SingleTickerProviderStateMixin {
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
    AddPackageWidget(),
    OurPackagesWidget(),
    ProposalWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: Spaces.defaultHorizontalPadding,
          right: Spaces.defaultHorizontalPadding,
          top: Spaces.defaultVerticalPadding,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomAppBar(),
            SizedBox(height: 16.h),
            const CustomSearchBar(),
            SizedBox(height: 12.h),
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
                Tab(text: "Add Requirement"),
                Tab(text: "My Requirement"),
                Tab(text: "Create Requirement"),
              ],
              labelStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
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
    );
  }
}
