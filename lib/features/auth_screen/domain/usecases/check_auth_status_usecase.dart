import 'package:on_a_trip/common/helper/usecase.dart';
import 'package:on_a_trip/features/auth_screen/domain/repository/auth_screen_repository.dart';

class CheckAuthStatusUsecase extends Usecase<bool, void> {
  final AuthScreenRepository authScreenRepository;

  CheckAuthStatusUsecase({required this.authScreenRepository});

  @override
  bool execute({required void params}) {
    try {
      return authScreenRepository.checkAuthStatus();
    } catch (e) {
      rethrow;
    }
  }
}
