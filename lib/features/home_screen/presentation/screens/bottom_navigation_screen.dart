// ignore_for_file: deprecated_member_use_from_same_package

import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:on_a_trip/common/constants/colors.dart';
import 'package:on_a_trip/features/destination_screen/presentation/screens/destination_screen.dart';
import 'package:on_a_trip/features/home_screen/presentation/screens/home_screen.dart';
import 'package:on_a_trip/features/home_screen/presentation/widgets/bottom_navigation_provider.dart';
import 'package:on_a_trip/features/notification_screen/notification_screen.dart';
import 'package:on_a_trip/features/profile_screen/presentation/screens/profile_screen.dart';
import 'package:on_a_trip/gen/assets.gen.dart';
import 'package:provider/provider.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  static final List<Widget> _selectedScreen = [
    const HomeScreen(),
    const DestinationScreen(),
    const HomeScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

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
            body: _selectedScreen[bottomNavigationProvider.selectedIndex],
          ),
        );
      },
    );
  }
}
