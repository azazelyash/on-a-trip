import 'dart:developer';

import 'package:on_a_trip/common/helper/token_manager.dart';
import 'package:on_a_trip/features/auth_screen/data/data_source/auth_screen_remote_data_source.dart';
import 'package:on_a_trip/features/auth_screen/data/models/user_model.dart';
import 'package:on_a_trip/features/auth_screen/domain/repository/auth_screen_repository.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/create_account_usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/create_profile_usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/login_usecase.dart';

class AuthScreenRepositoryImpl implements AuthScreenRepository {
  final TokenManager tokenManager;
  final AuthScreenRemoteDataSource authScreenRemoteDataSource;

  AuthScreenRepositoryImpl({
    required this.tokenManager,
    required this.authScreenRemoteDataSource,
  });

  @override
  Future<void> login({required LoginParams params}) async {
    try {
      final token = await authScreenRemoteDataSource.login(
        params: params,
      );

      await tokenManager.saveAccessToken(token: token);
    } catch (e) {
      rethrow;
    }
  }

  @override
  bool checkAuthStatus() {
    try {
      final token = tokenManager.getAccessToken();

      if (token != null) {
        return true;
      }

      return false;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> getUserDetails() async {
    try {
      final token = tokenManager.getAccessToken();

      if (token != null) {
        final user = await authScreenRemoteDataSource.getUserDetails(token: token);
        await tokenManager.saveUserRole(userRole: user.userType!);
        return user;
      } else {
        throw "Access Token Not Found";
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    try {
      await tokenManager.clearUserData();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> createAccount({required CreateAccountParams params}) async {
    try {
      await authScreenRemoteDataSource.createAccount(params: params);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> createProfile({required CreateProfileParams params}) async {
    try {
      final token = tokenManager.getAccessToken();

      if (token != null) {
        await authScreenRemoteDataSource.createProfile(
          token: token,
          params: params,
        );
      } else {
        throw "Access Token Not Found";
      }
    } catch (e) {
      rethrow;
    }
  }
}
