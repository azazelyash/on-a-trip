import 'dart:async';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:on_a_trip/common/helper/loading_provider.dart';
import 'package:on_a_trip/features/auth_screen/data/models/user_model.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/check_auth_status_usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/create_account_usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/get_user_details_usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/login_usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/logout_usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/reset_password_usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/send_otp_usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/verify_otp_usecase.dart';

class AuthScreenProvider extends LoadingProvider {
  final LoginUsecase loginUsecase;
  final LogoutUsecase logoutUsecase;
  final SendOtpUsecase sendOtpUsecase;
  final VerifyOtpUsecase verifyOtpUsecase;
  final ResetPasswordUsecase resetPasswordUsecase;
  final CreateAccountUsecase createAccountUsecase;
  final GetUserDetailsUsecase getUserDetailsUsecase;
  final CheckAuthStatusUsecase checkAuthStatusUsecase;

  AuthScreenProvider({
    required this.sendOtpUsecase,
    required this.verifyOtpUsecase,
    required this.resetPasswordUsecase,
    required this.loginUsecase,
    required this.logoutUsecase,
    required this.createAccountUsecase,
    required this.getUserDetailsUsecase,
    required this.checkAuthStatusUsecase,
  });

  UserModel? _userModel;
  UserModel? get userModel => _userModel;

  set userModel(UserModel? value) {
    _userModel = value;
    notifyListeners();
  }

  String? _userRole;
  String? get userRole => _userRole;

  set userRole(String? value) {
    _userRole = value;
    notifyListeners();
  }

  String? _selectedBusinessUserType;
  String? get selectedBusinessUserType => _selectedBusinessUserType;

  set selectedBusinessUserType(String? value) {
    _selectedBusinessUserType = value;
    notifyListeners();
  }

  bool _isObscure = true;
  bool get isObscure => _isObscure;

  set isObscure(bool value) {
    _isObscure = value;
    notifyListeners();
  }

  bool? _isTransportAvailable = false;
  bool? get isTransportAvailable => _isTransportAvailable;

  set isTransportAvailable(bool? value) {
    _isTransportAvailable = value;
    notifyListeners();
  }

  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  set isAuthenticated(bool value) {
    _isAuthenticated = value;
    notifyListeners();
  }

  String? _sendOtpEmail;
  String? get sendOtpEmail => _sendOtpEmail;

  set sendOtpEmail(String? value) {
    _sendOtpEmail = value;
    notifyListeners();
  }

  int _remainingTime = 59;
  int get remainingTime => _remainingTime;

  set remainingTime(int value) {
    _remainingTime = value;
    notifyListeners();
  }

  bool _isTimerActive = false;
  bool get isTimerActive => _isTimerActive;

  set isTimerActive(bool value) {
    _isTimerActive = value;
    notifyListeners();
  }

  String? _verifyOtpToken;
  String? get verifyOtpToken => _verifyOtpToken;

  set verifyOtpToken(String? value) {
    _verifyOtpToken = value;
    notifyListeners();
  }

  String? _resetPasswordToken;
  String? get resetPasswordToken => _resetPasswordToken;

  set resetPasswordToken(String? value) {
    _resetPasswordToken = value;
    notifyListeners();
  }

  void startTime() {
    isTimerActive = true;
    remainingTime = 59;
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_remainingTime == 0) {
        timer.cancel();
        isTimerActive = false;
      } else {
        remainingTime--;
      }
    });
  }

  Future<void> checkAuthStatus() async {
    try {
      final status = checkAuthStatusUsecase.execute(params: null);
      if (status) {
        await getUserDetails();
      }

      isAuthenticated = status;
    } catch (e) {
      rethrow;
    } finally {
      FlutterNativeSplash.remove();
    }
  }

  Future<void> login({required LoginParams params}) async {
    try {
      isLoading = true;
      await loginUsecase.execute(params: params);
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
    }
  }

  Future<void> getUserDetails() async {
    try {
      isLoading = true;
      userModel = await getUserDetailsUsecase.execute(params: null);
      userRole = userModel!.userType!;
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
    }
  }

  Future<void> sendOtp() async {
    try {
      isLoading = true;
      verifyOtpToken = await sendOtpUsecase.execute(params: sendOtpEmail!);
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
    }
  }

  Future<void> verifyOtp({required String otp}) async {
    try {
      isLoading = true;
      resetPasswordToken = await verifyOtpUsecase.execute(
        params: VerifyOtpParams(
          token: verifyOtpToken!,
          otp: otp,
        ),
      );
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
    }
  }

  Future<void> resetPassword({required String password}) async {
    try {
      isLoading = true;
      await resetPasswordUsecase.execute(
        params: ResetPasswordParams(
          token: resetPasswordToken!,
          password: password,
        ),
      );
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
    }
  }

  Future<void> createAccount({required CreateAccountParams params}) async {
    try {
      isLoading = true;
      await createAccountUsecase.execute(params: params);
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
    }
  }

  Future<void> logout() async {
    try {
      await logoutUsecase.execute(params: null);
    } catch (e) {
      rethrow;
    }
  }
}
