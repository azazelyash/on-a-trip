import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/common/widgets/custom_appbar.dart';
import 'package:on_a_trip/common/widgets/custom_search_bar.dart';
import 'package:on_a_trip/features/destination_screen/domain/usecases/get_holiday_package_usecase.dart';
import 'package:on_a_trip/features/destination_screen/presentation/provider/destination_screen_provider.dart';
import 'package:on_a_trip/features/destination_screen/presentation/screens/holiday_package_detail_screen.dart';
import 'package:on_a_trip/features/home_screen/presentation/screens/traveller_holiday_package_list_screen.dart';
import 'package:on_a_trip/features/home_screen/presentation/screens/traveller_hotel_list_screen.dart';
import 'package:on_a_trip/features/home_screen/presentation/screens/traveller_transports_list_screen.dart';
import 'package:on_a_trip/gen/assets.gen.dart';
import 'package:provider/provider.dart';

import '../widgets/category_tile_widget.dart';
import '../../../../common/constants/colors.dart';
import '../../../../common/constants/spaces.dart';
import '../widgets/recommendation_tile_wdiget.dart';
import '../widgets/popular_destination_tile_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          SizedBox(
            height: 96,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CategoryWidget(
                  onTap: () {},
                  image: Assets.images.traveller.provider(),
                  title: "Show All",
                  icon: Icons.menu,
                ),
                CategoryWidget(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const TravellerHotelListScreen(),
                      ),
                    );
                  },
                  image: Assets.images.hotelier.provider(),
                  title: "Hotel",
                  icon: Icons.hotel_outlined,
                ),
                CategoryWidget(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const TravellerHolidayPackageListScreen(),
                      ),
                    );
                  },
                  title: "Packages",
                  icon: Icons.hotel_class_outlined,
                  image: Assets.images.travelAgent.provider(),
                ),
                CategoryWidget(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const TravellerTransportsListScreen(),
                      ),
                    );
                  },
                  image: Assets.images.transporter.provider(),
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
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => HolidayPackageDetailScreen(holidayPackageModel: data),
                                ),
                              );
                            },
                            title: data.title ?? "-",
                            locationSubtitle: data.transportType ?? "-",
                            imageUrl: data.images != null ? data.images![0] : null,
                          );
                        },
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
