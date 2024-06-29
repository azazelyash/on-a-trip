import 'package:on_a_trip/common/helper/loading_provider.dart';

class BottomNavigationProvider extends LoadingProvider {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  set selectedIndex(int newValue) {
    _selectedIndex = newValue;
    notifyListeners();
  }
}
