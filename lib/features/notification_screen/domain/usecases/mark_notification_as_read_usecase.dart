import 'dart:async';

import 'package:on_a_trip/common/helper/usecase.dart';
import 'package:on_a_trip/features/notification_screen/domain/repository/notification_screen_repository.dart';

class MarkNotificationAsReadUsecase extends Usecase<Future<void>, int> {
  final NotificationScreenRepository notificationScreenRepository;

  MarkNotificationAsReadUsecase({required this.notificationScreenRepository});

  @override
  Future<void> execute({required int params}) async {
    try {
      await notificationScreenRepository.markNotificationAsRead(id: params);
    } catch (e) {
      rethrow;
    }
  }
}
