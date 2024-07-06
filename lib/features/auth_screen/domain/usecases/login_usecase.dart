import 'package:on_a_trip/common/helper/usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/repository/auth_screen_repository.dart';

class LoginUsecase extends Usecase<Future<void>, LoginParams> {
  final AuthScreenRepository authScreenRepository;

  LoginUsecase({required this.authScreenRepository});

  @override
  Future<void> execute({required LoginParams params}) async {
    try {
      await authScreenRepository.login(params: params);
    } catch (e) {
      rethrow;
    }
  }
}

class LoginParams {
  String email;
  String password;

  LoginParams({
    required this.email,
    required this.password,
  });
}
