import 'dart:async';

import 'package:on_a_trip/common/helper/usecase.dart';
import 'package:on_a_trip/features/destination_screen/data/models/transport_package_model.dart';
import 'package:on_a_trip/features/destination_screen/domain/repository/destination_screen_repository.dart';

class GetTransportPackageUsecase extends Usecase<Future<List<TransportPackageModel>>, GetTransportPackageParams> {
  final DestinationScreenRepository destinationScreenRepository;

  GetTransportPackageUsecase({required this.destinationScreenRepository});

  @override
  Future<List<TransportPackageModel>> execute({required GetTransportPackageParams params}) async {
    try {
      return await destinationScreenRepository.getTransportPackages(params: params);
    } catch (e) {
      rethrow;
    }
  }
}

class GetTransportPackageParams {
  final int page;
  final String? searchKey;

  GetTransportPackageParams({
    required this.page,
    this.searchKey,
  });
}
