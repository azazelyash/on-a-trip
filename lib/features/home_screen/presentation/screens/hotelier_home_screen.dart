import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/common/widgets/custom_appbar.dart';
import 'package:on_a_trip/common/widgets/custom_search_bar.dart';
import 'package:on_a_trip/features/destination_screen/domain/usecases/get_hotel_package_usecase.dart';
import 'package:on_a_trip/features/destination_screen/presentation/provider/destination_screen_provider.dart';
import 'package:on_a_trip/features/home_screen/presentation/widgets/bottom_navigation_provider.dart';
import 'package:on_a_trip/features/home_screen/presentation/widgets/my_prroposal_tile_widget.dart';
import 'package:on_a_trip/features/home_screen/presentation/widgets/new_proposal_tile_widget.dart';
import 'package:provider/provider.dart';

import '../../../../common/constants/colors.dart';
import '../../../../common/constants/spaces.dart';
import '../widgets/popular_destination_tile_widget.dart';

class HotelierHomeScreen extends StatefulWidget {
  const HotelierHomeScreen({super.key});

  @override
  State<HotelierHomeScreen> createState() => _HotelierHomeScreenState();
}

class _HotelierHomeScreenState extends State<HotelierHomeScreen> {
  @override
  void initState() {
    Future.microtask(() {
      getHotelPackage();
    });
    super.initState();
  }

  Future<void> getHotelPackage() async {
    final destinationProvider = context.read<DestinationScreenProvider>();
    await destinationProvider.getHotelPackage(
      params: GetHotelPackageParams(page: 1),
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
                "My Hotel Packages",
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
                : (context.watch<DestinationScreenProvider>().myHotelPackages.isEmpty)
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
                                getHotelPackage();
                              },
                              child: const Text("Retry"),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: context.watch<DestinationScreenProvider>().myHotelPackages.length,
                        itemBuilder: (context, index) {
                          final data = context.watch<DestinationScreenProvider>().myHotelPackages[index];
                          return PopularDestinationTileWidget(
                            imageUrl: data.image![0],
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
