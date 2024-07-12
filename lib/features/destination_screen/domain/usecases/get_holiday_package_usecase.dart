import 'package:on_a_trip/common/helper/usecase.dart';
import 'package:on_a_trip/features/destination_screen/data/models/holiday_package_model.dart';
import 'package:on_a_trip/features/destination_screen/domain/repository/destination_screen_repository.dart';

class GetHolidayPackageUsecase extends Usecase<Future<List<HolidayPackageModel>>, GetHolidayPackageParams> {
  final DestinationScreenRepository destinationScreenRepository;

  GetHolidayPackageUsecase({required this.destinationScreenRepository});

  @override
  Future<List<HolidayPackageModel>> execute({required GetHolidayPackageParams params}) async {
    try {
      return await destinationScreenRepository.getHolidayPackages(params: params);
    } catch (e) {
      rethrow;
    }
  }
}

class GetHolidayPackageParams {
  int page;
  String? search;

  GetHolidayPackageParams({
    required this.page,
    this.search,
  });
}
