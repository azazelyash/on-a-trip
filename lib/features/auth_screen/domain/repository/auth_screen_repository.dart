import 'package:on_a_trip/features/auth_screen/data/models/user_model.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/create_account_usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/create_profile_usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/login_usecase.dart';

abstract class AuthScreenRepository {
  Future<void> logout();
  bool checkAuthStatus();
  Future<UserModel> getUserDetails();
  Future<void> login({required LoginParams params});
  Future<void> createProfile({required CreateProfileParams params});
  Future<void> createAccount({required CreateAccountParams params});
}
