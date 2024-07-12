import 'package:on_a_trip/common/constants/form_data_params_model.dart';
import 'package:on_a_trip/common/helper/token_manager.dart';
import 'package:on_a_trip/features/destination_screen/data/data_source/destination_screen_remote_data_source.dart';
import 'package:on_a_trip/features/destination_screen/data/models/holiday_package_model.dart';
import 'package:on_a_trip/features/destination_screen/data/models/hotel_package_model.dart';
import 'package:on_a_trip/features/destination_screen/data/models/transport_package_model.dart';
import 'package:on_a_trip/features/destination_screen/domain/repository/destination_screen_repository.dart';
import 'package:on_a_trip/features/destination_screen/domain/usecases/get_holiday_package_usecase.dart';
import 'package:on_a_trip/features/destination_screen/domain/usecases/get_hotel_package_usecase.dart';
import 'package:on_a_trip/features/destination_screen/domain/usecases/get_transport_package_usecase.dart';

class DestinationScreenRepositoryImpl implements DestinationScreenRepository {
  final TokenManager tokenManager;
  final DestinationScreenRemoteDataSource destinationScreenRemoteDataSource;

  DestinationScreenRepositoryImpl({
    required this.tokenManager,
    required this.destinationScreenRemoteDataSource,
  });

  @override
  Future<void> addPackage({required FormDataParams params}) async {
    try {
      final String? token = tokenManager.getAccessToken();
      if (token != null) {
        await destinationScreenRemoteDataSource.addPackage(
          params: params,
          token: token,
        );
      } else {
        throw "Access Token Not Found!";
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<TransportPackageModel>> getTransportPackages({required GetTransportPackageParams params}) async {
    try {
      final String? token = tokenManager.getAccessToken();
      if (token != null) {
        return await destinationScreenRemoteDataSource.getTransportPackages(
          params: params,
          token: token,
        );
      } else {
        throw "Access Token Not Found!";
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<HolidayPackageModel>> getHolidayPackages({required GetHolidayPackageParams params}) async {
    try {
      final String? token = tokenManager.getAccessToken();
      if (token != null) {
        return await destinationScreenRemoteDataSource.getHolidayPackages(
          params: params,
          token: token,
        );
      } else {
        throw "Access Token Not Found!";
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<HotelPackageModel>> getHotelPackage({required GetHotelPackageParams params}) async {
    try {
      final String? token = tokenManager.getAccessToken();
      if (token != null) {
        return await destinationScreenRemoteDataSource.getHotelPackages(
          params: params,
          token: token,
        );
      } else {
        throw "Access Token Not Found!";
      }
    } catch (e) {
      rethrow;
    }
  }
}
