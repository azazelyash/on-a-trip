import 'dart:async';

import 'package:on_a_trip/common/helper/usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/repository/auth_screen_repository.dart';

class CreateAccountUsecase extends Usecase<Future<void>, CreateAccountParams> {
  final AuthScreenRepository authScreenRepository;

  CreateAccountUsecase({required this.authScreenRepository});

  @override
  Future<void> execute({required CreateAccountParams params}) async {
    try {
      await authScreenRepository.createAccount(params: params);
    } catch (e) {
      rethrow;
    }
  }
}

class CreateAccountParams {
  String name;
  String email;
  String password;
  String phone;
  String userType;

  CreateAccountParams({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.userType,
  });
}
