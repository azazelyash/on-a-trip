import 'package:on_a_trip/features/auth_screen/data/models/user_model.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/create_account_usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/create_profile_usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/login_usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/reset_password_usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/verify_otp_usecase.dart';

abstract class AuthScreenRepository {
  Future<void> logout();
  bool checkAuthStatus();
  Future<UserModel> getUserDetails();
  Future<String> sendOtp({required String email});
  Future<void> login({required LoginParams params});
  Future<String> verifyOtp({required VerifyOtpParams params});
  Future<void> createProfile({required CreateProfileParams params});
  Future<void> createAccount({required CreateAccountParams params});
  Future<void> resetPassword({required ResetPasswordParams params});
}
