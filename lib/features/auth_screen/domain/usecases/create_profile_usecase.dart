import 'package:on_a_trip/common/helper/usecase.dart';
import 'package:http/http.dart' as http;
import 'package:on_a_trip/features/auth_screen/domain/repository/auth_screen_repository.dart';

class CreateProfileUsecase extends Usecase<Future<void>, CreateProfileParams> {
  final AuthScreenRepository authScreenRepository;

  CreateProfileUsecase({required this.authScreenRepository});

  @override
  Future<void> execute({required CreateProfileParams params}) async {
    try {
      await authScreenRepository.createProfile(params: params);
    } catch (e) {
      rethrow;
    }
  }
}

class CreateProfileParams {
  Map<String, dynamic>? body;
  List<http.MultipartFile>? images;

  CreateProfileParams({
    this.body,
    this.images,
  });
}
