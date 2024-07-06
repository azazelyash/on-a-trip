import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:on_a_trip/common/helper/loading_provider.dart';
import 'package:on_a_trip/features/auth_screen/data/models/user_model.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/check_auth_status_usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/create_account_usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/get_user_details_usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/login_usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/logout_usecase.dart';

class AuthScreenProvider extends LoadingProvider {
  final LoginUsecase loginUsecase;
  final LogoutUsecase logoutUsecase;
  final CreateAccountUsecase createAccountUsecase;
  final GetUserDetailsUsecase getUserDetailsUsecase;
  final CheckAuthStatusUsecase checkAuthStatusUsecase;

  AuthScreenProvider({
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
      userModel = await getUserDetailsUsecase.execute(params: null);
      userRole = userModel!.userType!;
    } catch (e) {
      rethrow;
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
