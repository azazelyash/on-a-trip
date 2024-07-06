import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:on_a_trip/common/helper/loading_provider.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/create_profile_usecase.dart';

class CreateProfileProvider extends LoadingProvider {
  final CreateProfileUsecase createProfileUsecase;

  CreateProfileProvider({required this.createProfileUsecase});

  File? _hotelierBusinessCard;
  File? get hotelierBusinessCard => _hotelierBusinessCard;

  set hotelierBusinessCard(File? value) {
    _hotelierBusinessCard = value;
    notifyListeners();
  }

  File? _hotelierHotelImage;
  File? get hotelierHotelImage => _hotelierHotelImage;

  set hotelierHotelImage(File? value) {
    _hotelierHotelImage = value;
    notifyListeners();
  }

  File? _hotelierOwnerImage;
  File? get hotelierOwnerImage => _hotelierOwnerImage;

  set hotelierOwnerImage(File? value) {
    _hotelierOwnerImage = value;
    notifyListeners();
  }

  bool? _travelAgentTransportAv = false;
  bool? get travelAgentTransportAv => _travelAgentTransportAv;

  set travelAgentTransportAv(bool? newValue) {
    _travelAgentTransportAv = newValue;
    notifyListeners();
  }

  File? _travelAgentOfficeImage;
  File? get travelAgentOfficeImage => _travelAgentOfficeImage;

  set travelAgentOfficeImage(File? value) {
    _travelAgentOfficeImage = value;
    notifyListeners();
  }

  File? _travelAgentOwnerImage;
  File? get travelAgentOwnerImage => _travelAgentOwnerImage;

  set travelAgentOwnerImage(File? value) {
    _travelAgentOwnerImage = value;
    notifyListeners();
  }

  File? _transporterOwnerImage;
  File? get transporterOwnerImage => _transporterOwnerImage;

  set transporterOwnerImage(File? value) {
    _transporterOwnerImage = value;
    notifyListeners();
  }

  File? _transporterBusinessCardImage;
  File? get transporterBusinessCardImage => _transporterBusinessCardImage;

  set transporterBusinessCardImage(File? value) {
    _transporterBusinessCardImage = value;
    notifyListeners();
  }

  File? _transporterCompanyImage;
  File? get transporterCompanyImage => _transporterCompanyImage;

  set transporterCompanyImage(File? value) {
    _transporterCompanyImage = value;
    notifyListeners();
  }

  File? _transporterCabImage;
  File? get transporterCabImage => _transporterCabImage;

  set transporterCabImage(File? value) {
    _transporterCabImage = value;
    notifyListeners();
  }

  Future<void> createProfile({
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

      await createProfileUsecase.execute(
        params: CreateProfileParams(body: body, images: imageList),
      );
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
    }
  }
}
