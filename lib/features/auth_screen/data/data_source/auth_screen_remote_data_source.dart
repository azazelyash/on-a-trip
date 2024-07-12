import 'dart:convert';
import 'dart:developer';
import 'package:on_a_trip/common/constants/endpoints.dart';
import 'package:on_a_trip/common/helper/http_services.dart';
import 'package:on_a_trip/features/auth_screen/data/models/user_model.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/create_account_usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/create_profile_usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/usecases/login_usecase.dart';

class AuthScreenRemoteDataSource {
  final HttpService _httpService;

  AuthScreenRemoteDataSource({
    required HttpService httpService,
  }) : _httpService = httpService;

  Future<String> login({required LoginParams params}) async {
    try {
      final response = await _httpService.postFormData(
        url: Endpoints.loginUrl,
        headers: {
          "Content-Type": "application/form-data",
        },
        body: {
          "type": "login",
          "email": params.email,
          "password": params.password,
        },
      );

      return response["data"]["auth_token"];
    } catch (e) {
      final error = json.decode(e.toString());
      if (error["errorMessage"] != null) {
        throw error["errorMessage"].toString();
      } else {
        rethrow;
      }
    }
  }

  Future<UserModel> getUserDetails({required String token}) async {
    try {
      log(token, name: "Token");

      final response = await _httpService.get(
        url: "${Endpoints.getUserDetail}?type=getUserDetail",
        headers: {
          "authorization": "Bearer $token",
        },
      );

      final data = UserModel.fromJson(response["data"]);
      log(data.toJson().toString(), name: "UserModel");

      return data;
    } catch (e) {
      final error = json.decode(e.toString());
      if (error["errorMessage"] != null) {
        throw error["errorMessage"].toString();
      } else {
        rethrow;
      }
    }
  }

  Future<void> createAccount({required CreateAccountParams params}) async {
    try {
      await _httpService.postFormData(
        url: Endpoints.loginUrl,
        headers: {
          "Content-Type": "application/form-data",
        },
        body: {
          "type": "createAccount",
          "name": params.name,
          "email": params.email,
          "phone": params.phone,
          "password": params.password,
          "user_type": params.userType,
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createProfile({
    required CreateProfileParams params,
    required String token,
  }) async {
    try {
      await _httpService.postFormData(
        url: Endpoints.getUserDetail,
        headers: {
          "Authorization": "Bearer $token",
        },
        images: params.images,
        body: params.body!,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<String> sendOtp({required String email}) async {
    try {
      final response = await _httpService.postFormData(
        url: Endpoints.loginUrl,
        headers: {
          "Content-Type": "application/form-data",
        },
        body: {
          "type": "forgetPassword",
          "email": email,
        },
      );

      return response["data"]["otp_token"];
    } catch (e) {
      final error = json.decode(e.toString());
      if (error["errorMessage"] != null) {
        throw error["errorMessage"].toString();
      } else {
        rethrow;
      }
    }
  }

  Future<String> verifyOtp({required String otp, required String token}) async {
    try {
      final response = await _httpService.postFormData(
        url: Endpoints.loginUrl,
        headers: {
          "Content-Type": "application/form-data",
          "Authorization": "Bearer $token",
        },
        body: {
          "type": "forgetPassword",
          "otp": otp,
        },
      );

      return response["data"]["password_token"];
    } catch (e) {
      final error = json.decode(e.toString());
      if (error["errorMessage"] != null) {
        throw error["errorMessage"].toString();
      } else {
        rethrow;
      }
    }
  }

  Future<String> changePassword({required String newPassword, required String token}) async {
    try {
      final response = await _httpService.postFormData(
        url: Endpoints.loginUrl,
        headers: {
          "Content-Type": "application/form-data",
          "Authorization": "Bearer $token",
        },
        body: {
          "type": "forgetPassword",
          "password": newPassword,
        },
      );

      return response["data"]["token"];
    } catch (e) {
      final error = json.decode(e.toString());
      if (error["errorMessage"] != null) {
        throw error["errorMessage"].toString();
      } else {
        rethrow;
      }
    }
  }
}
