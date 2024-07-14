import 'package:on_a_trip/common/helper/loading_provider.dart';
import 'package:on_a_trip/features/notification_screen/data/models/notification_model.dart';
import 'package:on_a_trip/features/notification_screen/domain/usecases/get_all_notifications_usecase.dart';
import 'package:on_a_trip/features/notification_screen/domain/usecases/mark_notification_as_read_usecase.dart';

class NotificationScreenProvider extends LoadingProvider {
  final GetAllNotificationsUsecase getAllNotificationsUsecase;
  final MarkNotificationAsReadUsecase markNotificationAsReadUsecase;

  NotificationScreenProvider({
    required this.getAllNotificationsUsecase,
    required this.markNotificationAsReadUsecase,
  });

  List<NotificationModel> _notifications = [];
  List<NotificationModel> get notifications => _notifications;

  set notifications(List<NotificationModel> value) {
    _notifications = value;
    notifyListeners();
  }

  Future<void> getNotifications() async {
    try {
      isLoading = true;
      notifications = await getAllNotificationsUsecase.execute(params: null);
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
    }
  }

  Future<void> markAsRead(int id) async {
    try {
      await markNotificationAsReadUsecase.execute(params: id);
    } catch (e) {
      rethrow;
    }
  }
}
