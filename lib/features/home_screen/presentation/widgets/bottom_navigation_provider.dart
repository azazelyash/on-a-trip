import 'package:on_a_trip/common/helper/loading_provider.dart';

class BottomNavigationProvider extends LoadingProvider {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  set selectedIndex(int newValue) {
    _selectedIndex = newValue;
    notifyListeners();
  }

  int _selectedTabIndex = 0;
  int get selectedTabIndex => _selectedTabIndex;

  set selectedTabIndex(int newValue) {
    _selectedTabIndex = newValue;
    notifyListeners();
  }

  void navigateToTab(int tabIndex, int index) {
    _selectedIndex = index;
    _selectedTabIndex = tabIndex;
    notifyListeners();
  }
}
