import 'package:on_a_trip/common/helper/usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/repository/auth_screen_repository.dart';

class VerifyOtpUsecase extends Usecase<Future<String>, VerifyOtpParams> {
  final AuthScreenRepository authScreenRepository;

  VerifyOtpUsecase({required this.authScreenRepository});

  @override
  Future<String> execute({required VerifyOtpParams params}) async {
    try {
      return await authScreenRepository.verifyOtp(params: params);
    } catch (e) {
      rethrow;
    }
  }
}

class VerifyOtpParams {
  String token;
  String otp;

  VerifyOtpParams({
    required this.token,
    required this.otp,
  });
}
