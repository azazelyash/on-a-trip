import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/common/themes/button_theme.dart';
import 'package:on_a_trip/common/themes/input_decoration_theme.dart';
import 'package:on_a_trip/common/themes/text_button_theme.dart';
import 'package:on_a_trip/features/auth_screen/presentation/provider/auth_screen_provider.dart';
import 'package:on_a_trip/features/destination_screen/presentation/provider/destination_screen_provider.dart';
import 'package:on_a_trip/features/home_screen/presentation/widgets/bottom_navigation_provider.dart';
import 'package:on_a_trip/features/onboarding_screens/presentation/screens/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/helper/http_services.dart';
import 'common/helper/token_manager.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
    required this.sharedPreferences,
  });

  final SharedPreferences sharedPreferences;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final HttpService httpService = HttpService();
    final TokenManager tokenManager = TokenManager(sharedPreferences: widget.sharedPreferences);

    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<AuthScreenProvider>(
              create: (context) => AuthScreenProvider(),
            ),
            ChangeNotifierProvider<BottomNavigationProvider>(
              create: (context) => BottomNavigationProvider(),
            ),
            ChangeNotifierProvider<DestinationScreenProvider>(
              create: (context) => DestinationScreenProvider(),
            ),
          ],
          child: child,
        );
      },
      child: Consumer<AuthScreenProvider>(
        builder: (context, authScreenProvider, child) {
          return MaterialApp(
            theme: ThemeData(
              useMaterial3: false,
              textButtonTheme: CustomTextButtonThemeData.lightThemeData,
              elevatedButtonTheme: CustomElevatedButtonThemeData.lightThemeData,
              outlinedButtonTheme: CustomOutlineButtonThemeData.lightThemeData,
              inputDecorationTheme: InputDecorationThemeData.lightThemeData,
            ),
            debugShowCheckedModeBanner: false,
            home: const OnboardingScreen(),
          );
        },
      ),
    );
  }
}
