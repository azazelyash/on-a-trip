import 'package:on_a_trip/common/helper/usecase.dart';
import 'package:on_a_trip/features/destination_screen/data/models/hotel_package_model.dart';
import 'package:on_a_trip/features/destination_screen/domain/repository/destination_screen_repository.dart';

class GetHotelPackageUsecase extends Usecase<Future<List<HotelPackageModel>>, GetHotelPackageParams> {
  final DestinationScreenRepository destinationScreenRepository;

  GetHotelPackageUsecase({required this.destinationScreenRepository});

  @override
  Future<List<HotelPackageModel>> execute({required GetHotelPackageParams params}) async {
    try {
      return await destinationScreenRepository.getHotelPackage(params: params);
    } catch (e) {
      rethrow;
    }
  }
}

class GetHotelPackageParams {
  int page;
  String? search;

  GetHotelPackageParams({
    required this.page,
    this.search,
  });
}
