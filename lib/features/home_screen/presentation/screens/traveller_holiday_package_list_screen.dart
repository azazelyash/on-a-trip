import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:on_a_trip/common/constants/spaces.dart';
import 'package:on_a_trip/common/widgets/back_button_appbar.dart';
import 'package:on_a_trip/features/destination_screen/data/models/holiday_package_model.dart';
import 'package:on_a_trip/features/destination_screen/domain/usecases/get_holiday_package_usecase.dart';
import 'package:on_a_trip/features/destination_screen/presentation/provider/destination_screen_provider.dart';
import 'package:on_a_trip/features/destination_screen/presentation/screens/holiday_package_detail_screen.dart';
import 'package:on_a_trip/features/destination_screen/presentation/widgets/saved_places_list_widget.dart';
import 'package:provider/provider.dart';

class TravellerHolidayPackageListScreen extends StatefulWidget {
  const TravellerHolidayPackageListScreen({super.key});

  @override
  State<TravellerHolidayPackageListScreen> createState() => _TravellerHolidayPackageListScreenState();
}

class _TravellerHolidayPackageListScreenState extends State<TravellerHolidayPackageListScreen> {
  static const _pageSize = 10;

  final PagingController<int, HolidayPackageModel> _pagingController = PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final destinationProvider = context.read<DestinationScreenProvider>();
      final newItems = await destinationProvider.getHolidayPackage(
        params: GetHolidayPackageParams(page: pageKey),
      );
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: Spaces.defaultVerticalPadding,
            horizontal: Spaces.defaultHorizontalPadding,
          ),
          child: Column(
            children: [
              const BackButtonAppBar(),
              SizedBox(height: 20.h),
              const Text(
                "Holiday Packages",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.h),
              PagedListView<int, HolidayPackageModel>(
                shrinkWrap: true,
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<HolidayPackageModel>(
                  itemBuilder: (context, item, index) => SavedPlacesListWidget(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HolidayPackageDetailScreen(holidayPackageModel: item),
                        ),
                      );
                    },
                    imageUrl: item.images![0],
                    title: item.title!,
                    locationSubtitle: item.destination!.toString(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}