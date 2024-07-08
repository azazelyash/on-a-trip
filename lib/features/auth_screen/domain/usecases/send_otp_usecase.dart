import 'package:on_a_trip/common/helper/usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/repository/auth_screen_repository.dart';

class SendOtpUsecase extends Usecase<Future<String>, String> {
  final AuthScreenRepository authScreenRepository;

  SendOtpUsecase({required this.authScreenRepository});

  @override
  Future<String> execute({required String params}) async {
    try {
      return await authScreenRepository.sendOtp(email: params);
    } catch (e) {
      rethrow;
    }
  }
}
