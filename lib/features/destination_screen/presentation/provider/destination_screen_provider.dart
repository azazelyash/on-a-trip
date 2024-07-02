import 'package:on_a_trip/common/helper/loading_provider.dart';

class DestinationScreenProvider extends LoadingProvider {
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
}
