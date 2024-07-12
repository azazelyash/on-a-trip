import 'package:on_a_trip/common/constants/form_data_params_model.dart';
import 'package:on_a_trip/common/helper/usecase.dart';
import 'package:on_a_trip/features/destination_screen/domain/repository/destination_screen_repository.dart';

class AddPackageUsecase extends Usecase<Future<void>, FormDataParams> {
  final DestinationScreenRepository destinationScreenRepository;

  AddPackageUsecase({required this.destinationScreenRepository});

  @override
  Future<void> execute({required FormDataParams params}) async {
    try {
      await destinationScreenRepository.addPackage(params: params);
    } catch (e) {
      rethrow;
    }
  }
}
