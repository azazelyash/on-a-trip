// ignore_for_file: deprecated_member_use_from_same_package

import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:on_a_trip/common/constants/colors.dart';
import 'package:on_a_trip/features/bidding_screen/presentation/screens/bidding_screen.dart';
import 'package:on_a_trip/features/destination_screen/presentation/screens/destination_screen.dart';
import 'package:on_a_trip/features/destination_screen/presentation/screens/hotelier_destination_screen.dart';
import 'package:on_a_trip/features/destination_screen/presentation/screens/transporter_destination_screen.dart';
import 'package:on_a_trip/features/destination_screen/presentation/screens/travel_agent_destination_screen.dart';
import 'package:on_a_trip/features/home_screen/presentation/screens/home_screen.dart';
import 'package:on_a_trip/features/home_screen/presentation/screens/hotelier_home_screen.dart';
import 'package:on_a_trip/features/home_screen/presentation/screens/transporter_home_screen.dart';
import 'package:on_a_trip/features/home_screen/presentation/screens/travel_agent_home_screen.dart';
import 'package:on_a_trip/features/home_screen/presentation/widgets/bottom_navigation_provider.dart';
import 'package:on_a_trip/features/notification_screen/notification_screen.dart';
import 'package:on_a_trip/features/profile_screen/presentation/screens/profile_screen.dart';
import 'package:on_a_trip/gen/assets.gen.dart';
import 'package:provider/provider.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({
    super.key,
    required this.userType,
  });

  final String userType;

  static final List<Widget> _selectedUserScreen = [
    const HomeScreen(),
    const DestinationScreen(),
    const BiddingScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  static final List<Widget> _selectedTravelAgentScreen = [
    const TravelAgentHomeScreen(),
    const TravelAgentDestinationScreen(),
    const BiddingScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  static final List<Widget> _selectedHotelierScreen = [
    const HotelierHomeScreen(),
    const HotelierDestinationScreen(),
    const BiddingScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  static final List<Widget> _selectedTransporterScreen = [
    const TransporterHomeScreen(),
    const TransporterDestinationScreen(),
    const BiddingScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  List<Widget> getSelectedScreen() {
    if (userType == "traveller") {
      return _selectedUserScreen;
    } else if (userType == "travel_agent") {
      return _selectedTravelAgentScreen;
    } else if (userType == "hotelier") {
      return _selectedHotelierScreen;
    } else {
      return _selectedTransporterScreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationProvider>(
      builder: (context, bottomNavigationProvider, child) {
        return SafeArea(
          child: Scaffold(
            extendBody: true,
            backgroundColor: Colors.white,
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: CustomNavigationBar(
                onTap: (newIndex) {
                  bottomNavigationProvider.selectedIndex = newIndex;
                },
                currentIndex: bottomNavigationProvider.selectedIndex,
                borderRadius: const Radius.circular(20),
                isFloating: true,
                items: [
                  CustomNavigationBarItem(
                    icon: Assets.svg.home.svg(
                      color: (bottomNavigationProvider.selectedIndex == 0) ? CustomColors.primaryColor : CustomColors.highlightText,
                    ),
                  ),
                  CustomNavigationBarItem(
                    icon: Assets.svg.map.svg(
                      color: (bottomNavigationProvider.selectedIndex == 1) ? CustomColors.primaryColor : CustomColors.highlightText,
                    ),
                  ),
                  CustomNavigationBarItem(
                    icon: Assets.svg.bid.svg(
                      color: (bottomNavigationProvider.selectedIndex == 2) ? CustomColors.primaryColor : CustomColors.highlightText,
                    ),
                  ),
                  CustomNavigationBarItem(
                    icon: Assets.svg.notification.svg(
                      color: (bottomNavigationProvider.selectedIndex == 3) ? CustomColors.primaryColor : CustomColors.highlightText,
                    ),
                  ),
                  CustomNavigationBarItem(
                    icon: Assets.svg.profile.svg(
                      color: (bottomNavigationProvider.selectedIndex == 4) ? CustomColors.primaryColor : CustomColors.highlightText,
                    ),
                  ),
                ],
              ),
            ),
            body: getSelectedScreen()[bottomNavigationProvider.selectedIndex],
          ),
        );
      },
    );
  }
}
