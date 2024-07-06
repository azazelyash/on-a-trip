import 'package:on_a_trip/common/helper/usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/repository/auth_screen_repository.dart';

class LogoutUsecase extends Usecase<Future<void>, void> {
  final AuthScreenRepository authScreenRepository;

  LogoutUsecase({required this.authScreenRepository});

  @override
  Future<void> execute({required void params}) async {
    try {
      await authScreenRepository.logout();
    } catch (e) {
      rethrow;
    }
  }
}
