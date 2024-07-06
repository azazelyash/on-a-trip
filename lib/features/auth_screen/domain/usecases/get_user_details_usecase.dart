import 'package:on_a_trip/common/helper/usecase.dart';
import 'package:on_a_trip/features/auth_screen/data/models/user_model.dart';
import 'package:on_a_trip/features/auth_screen/domain/repository/auth_screen_repository.dart';

class GetUserDetailsUsecase extends Usecase<Future<UserModel>, void> {
  final AuthScreenRepository authScreenRepository;

  GetUserDetailsUsecase({required this.authScreenRepository});

  @override
  Future<UserModel> execute({required void params}) async {
    try {
      return await authScreenRepository.getUserDetails();
    } catch (e) {
      rethrow;
    }
  }
}
