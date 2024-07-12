import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:on_a_trip/common/constants/colors.dart';
import 'package:on_a_trip/common/themes/button_theme.dart';
import 'package:on_a_trip/common/themes/input_decoration_theme.dart';
import 'package:on_a_trip/common/themes/text_button_theme.dart';
import 'package:on_a_trip/features/auth_screen/data/data_source/auth_screen_remote_data_source.dart';
import 'package:on_a_trip/features/auth_screen/data/repository/auth_screen_repository_impl.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/check_auth_status_usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/create_account_usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/create_profile_usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/get_user_details_usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/login_usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/logout_usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/reset_password_usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/send_otp_usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/verify_otp_usecase.dart';
import 'package:on_a_trip/features/auth_screen/presentation/provider/auth_screen_provider.dart';
import 'package:on_a_trip/features/auth_screen/presentation/provider/create_profile_provider.dart';
import 'package:on_a_trip/features/auth_screen/presentation/screens/hotelier_form_screen.dart';
import 'package:on_a_trip/features/auth_screen/presentation/screens/transporter_form_screen.dart';
import 'package:on_a_trip/features/auth_screen/presentation/screens/travel_agent_from_screen.dart';
import 'package:on_a_trip/features/destination_screen/data/data_source/destination_screen_remote_data_source.dart';
import 'package:on_a_trip/features/destination_screen/data/repository/destination_screen_repository_impl.dart';
import 'package:on_a_trip/features/destination_screen/domain/usecases/add_package_usecase.dart';
import 'package:on_a_trip/features/destination_screen/domain/usecases/get_holiday_package_usecase.dart';
import 'package:on_a_trip/features/destination_screen/domain/usecases/get_hotel_package_usecase.dart';
import 'package:on_a_trip/features/destination_screen/domain/usecases/get_transport_package_usecase.dart';
import 'package:on_a_trip/features/destination_screen/presentation/provider/destination_screen_provider.dart';
import 'package:on_a_trip/features/home_screen/presentation/screens/bottom_navigation_screen.dart';
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

    final AuthScreenRepositoryImpl authScreenRepository = AuthScreenRepositoryImpl(
      tokenManager: tokenManager,
      authScreenRemoteDataSource: AuthScreenRemoteDataSource(httpService: httpService),
    );

    final DestinationScreenRepositoryImpl destinationScreenRepository = DestinationScreenRepositoryImpl(
      tokenManager: tokenManager,
      destinationScreenRemoteDataSource: DestinationScreenRemoteDataSource(httpService: httpService),
    );

    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<AuthScreenProvider>(
              create: (context) => AuthScreenProvider(
                loginUsecase: LoginUsecase(authScreenRepository: authScreenRepository),
                logoutUsecase: LogoutUsecase(authScreenRepository: authScreenRepository),
                sendOtpUsecase: SendOtpUsecase(authScreenRepository: authScreenRepository),
                verifyOtpUsecase: VerifyOtpUsecase(authScreenRepository: authScreenRepository),
                resetPasswordUsecase: ResetPasswordUsecase(authScreenRepository: authScreenRepository),
                createAccountUsecase: CreateAccountUsecase(authScreenRepository: authScreenRepository),
                getUserDetailsUsecase: GetUserDetailsUsecase(authScreenRepository: authScreenRepository),
                checkAuthStatusUsecase: CheckAuthStatusUsecase(authScreenRepository: authScreenRepository),
              )..checkAuthStatus(),
            ),
            ChangeNotifierProvider<CreateProfileProvider>(
              create: (context) => CreateProfileProvider(
                createProfileUsecase: CreateProfileUsecase(authScreenRepository: authScreenRepository),
              ),
            ),
            ChangeNotifierProvider<BottomNavigationProvider>(
              create: (context) => BottomNavigationProvider(),
            ),
            ChangeNotifierProvider<DestinationScreenProvider>(
              create: (context) => DestinationScreenProvider(
                getHotelPackageUsecase: GetHotelPackageUsecase(destinationScreenRepository: destinationScreenRepository),
                getHolidayPackageUsecase: GetHolidayPackageUsecase(destinationScreenRepository: destinationScreenRepository),
                addPackageUsecase: AddPackageUsecase(destinationScreenRepository: destinationScreenRepository),
                getTransportPackageUsecase: GetTransportPackageUsecase(destinationScreenRepository: destinationScreenRepository),
              ),
            ),
          ],
          child: child,
        );
      },
      child: Consumer<AuthScreenProvider>(
        builder: (context, authScreenProvider, child) {
          Widget homeScreen;

          if (!authScreenProvider.isAuthenticated) {
            homeScreen = const OnboardingScreen();
          } else {
            if (authScreenProvider.userRole == "traveller" || authScreenProvider.userModel!.otherDetails != false) {
              homeScreen = BottomNavigationScreen(userType: authScreenProvider.userRole!);
            } else {
              if (authScreenProvider.userModel!.userType == "hotelier") {
                homeScreen = const HotelierFormScreen();
              } else if (authScreenProvider.userModel!.userType == "travel_agent") {
                homeScreen = const TravelAgentFromScreen();
              } else {
                homeScreen = const TransporterFormScreen();
              }
            }
          }
          return MaterialApp(
            theme: ThemeData(
              useMaterial3: false,
              textSelectionTheme: TextSelectionThemeData(
                cursorColor: CustomColors.primaryColor,
                selectionHandleColor: CustomColors.primaryColor,
                selectionColor: CustomColors.primaryColor.withOpacity(0.3),
              ),
              textButtonTheme: CustomTextButtonThemeData.lightThemeData,
              elevatedButtonTheme: CustomElevatedButtonThemeData.lightThemeData,
              outlinedButtonTheme: CustomOutlineButtonThemeData.lightThemeData,
              inputDecorationTheme: InputDecorationThemeData.lightThemeData,
            ),
            debugShowCheckedModeBanner: false,
            home: homeScreen,
          );
        },
      ),
    );
  }
}
