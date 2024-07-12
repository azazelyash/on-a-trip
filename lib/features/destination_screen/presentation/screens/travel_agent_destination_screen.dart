import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/common/constants/colors.dart';
import 'package:on_a_trip/common/constants/spaces.dart';
import 'package:on_a_trip/common/widgets/custom_appbar.dart';
import 'package:on_a_trip/common/widgets/custom_search_bar.dart';
import 'package:on_a_trip/features/destination_screen/presentation/widgets/my_holiday_package_widget.dart';
import 'package:on_a_trip/features/destination_screen/presentation/widgets/proposal_widget.dart';
import 'package:on_a_trip/features/destination_screen/presentation/widgets/travel_agent_add_package_widget.dart';
import 'package:on_a_trip/features/home_screen/presentation/widgets/bottom_navigation_provider.dart';
import 'package:provider/provider.dart';

class TravelAgentDestinationScreen extends StatefulWidget {
  const TravelAgentDestinationScreen({super.key});

  @override
  State<TravelAgentDestinationScreen> createState() => _TravelAgentDestinationScreenState();
}

class _TravelAgentDestinationScreenState extends State<TravelAgentDestinationScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    final bottomNavProvider = context.read<BottomNavigationProvider>();
    _tabController.index = bottomNavProvider.selectedTabIndex;
    _tabController.addListener(() {
      bottomNavProvider.selectedTabIndex = _tabController.index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  static const List<Widget> _tabs = [
    TravelAgentAddPackageWidget(),
    MyHolidayPackageWidget(),
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
                Tab(text: "Add Package"),
                Tab(text: "My Packages"),
                Tab(text: "Bookings"),
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
    );
  }
}
