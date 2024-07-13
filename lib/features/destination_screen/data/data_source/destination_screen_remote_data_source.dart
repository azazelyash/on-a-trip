import 'dart:convert';
import 'dart:developer';

import 'package:on_a_trip/common/constants/endpoints.dart';
import 'package:on_a_trip/common/constants/form_data_params_model.dart';
import 'package:on_a_trip/common/helper/http_services.dart';
import 'package:on_a_trip/features/destination_screen/data/models/holiday_package_model.dart';
import 'package:on_a_trip/features/destination_screen/data/models/hotel_package_model.dart';
import 'package:on_a_trip/features/destination_screen/data/models/transport_package_model.dart';
import 'package:on_a_trip/features/destination_screen/domain/usecases/get_holiday_package_usecase.dart';
import 'package:on_a_trip/features/destination_screen/domain/usecases/get_hotel_package_usecase.dart';
import 'package:on_a_trip/features/destination_screen/domain/usecases/get_transport_package_usecase.dart';

class DestinationScreenRemoteDataSource {
  final HttpService _httpService;

  DestinationScreenRemoteDataSource({
    required HttpService httpService,
  }) : _httpService = httpService;

  Future<void> addPackage({
    required FormDataParams params,
    required String token,
  }) async {
    try {
      await _httpService.postFormData(
        url: Endpoints.packageApi,
        headers: {
          "Authorization": "Bearer $token",
        },
        images: params.images,
        body: params.body!,
      );
    } catch (e) {
      final error = json.decode(e.toString());
      if (error["errorMessage"] != null) {
        throw error["errorMessage"].toString();
      } else {
        final error = json.decode(e.toString());
        if (error["errorMessage"] != null) {
          throw error["errorMessage"].toString();
        } else {
          rethrow;
        }
      }
    }
  }

  Future<List<TransportPackageModel>> getTransportPackages({required String token, required GetTransportPackageParams params}) async {
    try {
      String url = "${Endpoints.packageApi}?type=getTransport&page=${params.page}";

      final response = await _httpService.get(
        url: url,
        headers: {
          "Authorization": "Bearer $token",
        },
      );

      log(response["data"].toString(), name: "Transport Packages Length");

      List<TransportPackageModel> data = List<TransportPackageModel>.generate(response["data"].length, (index) {
        return TransportPackageModel.fromJson(response["data"][index]);
      });

      log(data.toString(), name: "Transport Packages Data");

      return data;
    } catch (e) {
      final error = json.decode(e.toString());
      if (error["errorMessage"] != null) {
        throw error["errorMessage"].toString();
      } else {
        rethrow;
      }
    }
  }

  Future<List<HotelPackageModel>> getHotelPackages({required String token, required GetHotelPackageParams params}) async {
    try {
      String url = "${Endpoints.packageApi}?type=getHotel&page=${params.page}";

      final response = await _httpService.get(
        url: url,
        headers: {
          "Authorization": "Bearer $token",
        },
      );

      List<HotelPackageModel> data = List<HotelPackageModel>.generate(response["data"].length, (index) {
        return HotelPackageModel.fromJson(response["data"][index]);
      });

      return data;
    } catch (e) {
      final error = json.decode(e.toString());
      if (error["errorMessage"] != null) {
        throw error["errorMessage"].toString();
      } else {
        rethrow;
      }
    }
  }

  Future<List<HolidayPackageModel>> getHolidayPackages({required String token, required GetHolidayPackageParams params}) async {
    try {
      String url = "${Endpoints.packageApi}?type=getHolidayPackage&page=${params.page}";

      final response = await _httpService.get(
        url: url,
        headers: {
          "Authorization": "Bearer $token",
        },
      );

      List<HolidayPackageModel> data = List<HolidayPackageModel>.generate(response["data"].length, (index) {
        return HolidayPackageModel.fromJson(response["data"][index]);
      });

      return data;
    } catch (e) {
      final error = json.decode(e.toString());
      if (error["errorMessage"] != null) {
        throw error["errorMessage"].toString();
      } else {
        rethrow;
      }
    }
  }
}
