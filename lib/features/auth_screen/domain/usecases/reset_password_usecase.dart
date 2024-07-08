import 'package:on_a_trip/common/helper/usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/repository/auth_screen_repository.dart';

class ResetPasswordUsecase extends Usecase<Future<void>, ResetPasswordParams> {
  final AuthScreenRepository authScreenRepository;

  ResetPasswordUsecase({required this.authScreenRepository});

  @override
  Future<void> execute({required ResetPasswordParams params}) async {
    try {
      await authScreenRepository.resetPassword(params: params);
    } catch (e) {
      rethrow;
    }
  }
}

class ResetPasswordParams {
  String token;
  String password;

  ResetPasswordParams({
    required this.token,
    required this.password,
  });
}
