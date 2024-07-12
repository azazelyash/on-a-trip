import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:on_a_trip/common/constants/form_data_params_model.dart';
import 'package:on_a_trip/common/helper/loading_provider.dart';
import 'package:on_a_trip/features/destination_screen/data/models/holiday_package_model.dart';
import 'package:on_a_trip/features/destination_screen/data/models/hotel_package_model.dart';
import 'package:on_a_trip/features/destination_screen/data/models/transport_package_model.dart';
import 'package:on_a_trip/features/destination_screen/domain/usecases/add_package_usecase.dart';
import 'package:on_a_trip/features/destination_screen/domain/usecases/get_holiday_package_usecase.dart';
import 'package:on_a_trip/features/destination_screen/domain/usecases/get_hotel_package_usecase.dart';
import 'package:on_a_trip/features/destination_screen/domain/usecases/get_transport_package_usecase.dart';

class DestinationScreenProvider extends LoadingProvider {
  final AddPackageUsecase addPackageUsecase;
  final GetHotelPackageUsecase getHotelPackageUsecase;
  final GetHolidayPackageUsecase getHolidayPackageUsecase;
  final GetTransportPackageUsecase getTransportPackageUsecase;

  DestinationScreenProvider({
    required this.addPackageUsecase,
    required this.getHotelPackageUsecase,
    required this.getHolidayPackageUsecase,
    required this.getTransportPackageUsecase,
  });

  bool _includeTransportInHotelPackage = false;
  bool get includeTransportInHotelPackage => _includeTransportInHotelPackage;

  set includeTransportInHotelPackage(bool value) {
    _includeTransportInHotelPackage = value;
    notifyListeners();
  }

  bool _includeSightSeeingInHotelPackage = false;
  bool get includeSightSeeingInHotelPackage => _includeSightSeeingInHotelPackage;

  set includeSightSeeingInHotelPackage(bool value) {
    _includeSightSeeingInHotelPackage = value;
    notifyListeners();
  }

  List<File> _hotelPackageImages = [];
  List<File> get hotelPackageImages => _hotelPackageImages;

  set hotelPackageImages(List<File> value) {
    _hotelPackageImages = value;
    notifyListeners();
  }

  void removeHotelPackageImage(int index) {
    _hotelPackageImages.removeAt(index);
    notifyListeners();
  }

  List<File> _holidayPackageImages = [];
  List<File> get holidayPackageImages => _holidayPackageImages;

  set holidayPackageImages(List<File> value) {
    _holidayPackageImages = value;
    notifyListeners();
  }

  void removeHolidayPackageImage(int index) {
    _holidayPackageImages.removeAt(index);
    notifyListeners();
  }

  List<File> _transporterPackageImages = [];
  List<File> get transporterPackageImages => _transporterPackageImages;

  set transporterPackageImages(List<File> value) {
    _transporterPackageImages = value;
    notifyListeners();
  }

  void removeTransporterPackageImage(int index) {
    _transporterPackageImages.removeAt(index);
    notifyListeners();
  }

  Future<void> addPackage({
    required Map<String, dynamic> body,
    required Map<String, File> images,
  }) async {
    try {
      isLoading = true;
      List<http.MultipartFile> imageList = [];

      for (var image in images.entries) {
        final mimeTypeData = lookupMimeType(image.value.path)!.split('/');

        final http.MultipartFile file = await http.MultipartFile.fromPath(
          image.key,
          image.value.path,
          contentType: MediaType(mimeTypeData[0], mimeTypeData[1]),
        );

        imageList.add(file);
      }

      await addPackageUsecase.execute(
        params: FormDataParams(
          body: body,
          images: imageList,
        ),
      );
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
    }
  }

  Future<List<TransportPackageModel>> getTransportPackage({
    required GetTransportPackageParams params,
  }) async {
    try {
      return await getTransportPackageUsecase.execute(params: params);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<HotelPackageModel>> getHotelPackage({
    required GetHotelPackageParams params,
  }) async {
    try {
      return await getHotelPackageUsecase.execute(params: params);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<HolidayPackageModel>> getHolidayPackage({
    required GetHolidayPackageParams params,
  }) async {
    try {
      return await getHolidayPackageUsecase.execute(params: params);
    } catch (e) {
      rethrow;
    }
  }
}
