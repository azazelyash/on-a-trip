import 'package:on_a_trip/features/notification_screen/data/models/notification_model.dart';

abstract class NotificationScreenRepository {
  Future<List<NotificationModel>> getNotifications({int? page});
  Future<void> markNotificationAsRead({required int id});
}
