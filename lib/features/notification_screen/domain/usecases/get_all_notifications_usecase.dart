import 'package:on_a_trip/common/helper/usecase.dart';
import 'package:on_a_trip/features/notification_screen/data/models/notification_model.dart';
import 'package:on_a_trip/features/notification_screen/domain/repository/notification_screen_repository.dart';

class GetAllNotificationsUsecase extends Usecase<Future<List<NotificationModel>>, int?> {
  final NotificationScreenRepository notificationScreenRepository;

  GetAllNotificationsUsecase({required this.notificationScreenRepository});

  @override
  Future<List<NotificationModel>> execute({required int? params}) async {
    try {
      return await notificationScreenRepository.getNotifications(page: params);
    } catch (e) {
      rethrow;
    }
  }
}
