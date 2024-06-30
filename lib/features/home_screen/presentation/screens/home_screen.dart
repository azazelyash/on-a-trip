import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/common/widgets/custom_appbar.dart';
import 'package:on_a_trip/common/widgets/custom_search_bar.dart';

import '../widgets/category_tile_widget.dart';
import '../../../../common/constants/colors.dart';
import '../../../../common/constants/spaces.dart';
import '../widgets/recommendation_tile_wdiget.dart';
import '../widgets/popular_destination_tile_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                "What are you looking for?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.titleColor,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Show more",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 96,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CategoryWidget(
                  imgUrl: "https://blog.thomascook.in/wp-content/uploads/2017/01/Santorini-Greece.jpg",
                  title: "Show All",
                  icon: Icons.menu,
                ),
                CategoryWidget(
                  imgUrl: "https://blog.thomascook.in/wp-content/uploads/2017/01/Santorini-Greece.jpg",
                  title: "Hotel",
                  icon: Icons.hotel_outlined,
                ),
                CategoryWidget(
                  imgUrl: "https://blog.thomascook.in/wp-content/uploads/2017/01/Santorini-Greece.jpg",
                  title: "Packages",
                  icon: Icons.hotel_class_outlined,
                ),
                CategoryWidget(
                  imgUrl: "https://blog.thomascook.in/wp-content/uploads/2017/01/Santorini-Greece.jpg",
                  title: "Transport",
                  icon: Icons.car_rental,
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Popular Destinations",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.titleColor,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Show more",
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
                "Recommendations",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.titleColor,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Show more",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              RecommendationTileWidget(
                title: "Dolomites",
                imgUrl: "https://blog.thomascook.in/wp-content/uploads/2017/01/Santorini-Greece.jpg",
              ),
              RecommendationTileWidget(
                title: "Dolomites",
                imgUrl: "https://media.timeout.com/images/106032809/750/562/image.jpg",
              ),
              RecommendationTileWidget(
                title: "Dolomites",
                imgUrl: "https://ihplb.b-cdn.net/wp-content/uploads/2021/06/Maldives.jpeg",
              ),
              RecommendationTileWidget(
                title: "Dolomites",
                imgUrl: "https://theplanetd.com/images/vietnam-sapa-rice-terraces.jpg",
              ),
              RecommendationTileWidget(
                title: "Dolomites",
                imgUrl: "https://blog.thomascook.in/wp-content/uploads/2017/01/Cappadocia-Turkey-popsugar.com_.jpg",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
