import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/common/widgets/custom_appbar.dart';
import 'package:on_a_trip/common/widgets/custom_search_bar.dart';
import 'package:on_a_trip/features/home_screen/presentation/widgets/my_prroposal_tile_widget.dart';
import 'package:on_a_trip/features/home_screen/presentation/widgets/new_proposal_tile_widget.dart';

import '../../../../common/constants/colors.dart';
import '../../../../common/constants/spaces.dart';
import '../widgets/popular_destination_tile_widget.dart';

class HotelierHomeScreen extends StatelessWidget {
  const HotelierHomeScreen({super.key});

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
                onPressed: () {},
                child: const Text(
                  "View All",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 200,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: const [
                PopularDestinationTileWidget(
                  imageUrl: "https://blog.thomascook.in/wp-content/uploads/2017/01/Santorini-Greece.jpg",
                  title: "Santorini",
                  locationSubtitle: "Greece",
                ),
                PopularDestinationTileWidget(
                  imageUrl: "https://blog.thomascook.in/wp-content/uploads/2017/01/Cappadocia-Turkey-popsugar.com_.jpg",
                  title: "Santorini",
                  locationSubtitle: "Greece",
                ),
                PopularDestinationTileWidget(
                  imageUrl: "https://ihplb.b-cdn.net/wp-content/uploads/2021/06/Maldives.jpeg",
                  title: "Santorini",
                  locationSubtitle: "Greece",
                ),
                PopularDestinationTileWidget(
                  imageUrl: "https://theplanetd.com/images/vietnam-sapa-rice-terraces.jpg",
                  title: "Santorini",
                  locationSubtitle: "Greece",
                ),
                PopularDestinationTileWidget(
                  imageUrl: "https://media.timeout.com/images/106032809/750/562/image.jpg",
                  title: "Santorini",
                  locationSubtitle: "Greece",
                ),
              ],
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
