import 'package:on_a_trip/common/helper/loading_provider.dart';

class AuthScreenProvider extends LoadingProvider {
  bool? _isTransportAvailable = false;
  bool? get isTransportAvailable => _isTransportAvailable;

  set isTransportAvailable(bool? value) {
    _isTransportAvailable = value;
    notifyListeners();
  }
}
