import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/common/widgets/custom_appbar.dart';
import 'package:on_a_trip/common/widgets/custom_search_bar.dart';
import 'package:on_a_trip/features/destination_screen/domain/usecases/get_holiday_package_usecase.dart';
import 'package:on_a_trip/features/destination_screen/presentation/provider/destination_screen_provider.dart';
import 'package:on_a_trip/features/home_screen/presentation/widgets/bottom_navigation_provider.dart';
import 'package:on_a_trip/features/home_screen/presentation/widgets/my_prroposal_tile_widget.dart';
import 'package:on_a_trip/features/home_screen/presentation/widgets/new_proposal_tile_widget.dart';
import 'package:provider/provider.dart';

import '../../../../common/constants/colors.dart';
import '../../../../common/constants/spaces.dart';
import '../widgets/popular_destination_tile_widget.dart';

class TravelAgentHomeScreen extends StatefulWidget {
  const TravelAgentHomeScreen({super.key});

  @override
  State<TravelAgentHomeScreen> createState() => _TravelAgentHomeScreenState();
}

class _TravelAgentHomeScreenState extends State<TravelAgentHomeScreen> {
  @override
  void initState() {
    Future.microtask(() {
      getHolidayPackage();
    });
    super.initState();
  }

  Future<void> getHolidayPackage() async {
    final destinationProvider = context.read<DestinationScreenProvider>();
    await destinationProvider.getHolidayPackage(
      params: GetHolidayPackageParams(page: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: Spaces.defaultHorizontalPadding,
        vertical: Spaces.defaultVerticalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          SizedBox(height: 16.h),
          const CustomSearchBar(),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "My Holiday Packages",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.titleColor,
                ),
              ),
              TextButton(
                onPressed: () {
                  context.read<BottomNavigationProvider>().navigateToTab(1, 1);
                },
                child: const Text(
                  "View All",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 200,
            child: (context.watch<DestinationScreenProvider>().isLoading)
                ? const Center(
                    child: CircularProgressIndicator(color: CustomColors.primaryColor),
                  )
                : (context.watch<DestinationScreenProvider>().myHolidayPackages.isEmpty)
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "No data found",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: CustomColors.titleColor,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                getHolidayPackage();
                              },
                              child: const Text("Retry"),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: context.watch<DestinationScreenProvider>().myHolidayPackages.length,
                        itemBuilder: (context, index) {
                          final data = context.watch<DestinationScreenProvider>().myHolidayPackages[index];
                          return PopularDestinationTileWidget(
                            imageUrl: data.images![0],
                            title: data.title!,
                            locationSubtitle: data.transportType!,
                          );
                        },
                      ),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "New Proposals",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.titleColor,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "View All",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
          ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => NewProposalTileWidget(
              isLast: index == 2,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "My Proposals",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.titleColor,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "View All",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
          ListView.builder(
            itemCount: 7,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => MyPrroposalTileWidget(
              isLast: index == 6,
            ),
          ),
          const SizedBox(height: kBottomNavigationBarHeight),
        ],
      ),
    );
  }
}
