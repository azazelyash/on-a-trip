import 'package:on_a_trip/common/helper/token_manager.dart';
import 'package:on_a_trip/features/notification_screen/data/data_source/notification_screen_remote_data_source.dart';
import 'package:on_a_trip/features/notification_screen/data/models/notification_model.dart';
import 'package:on_a_trip/features/notification_screen/domain/repository/notification_screen_repository.dart';

class NotificationScreenRepositoryImpl implements NotificationScreenRepository {
  final TokenManager tokenManager;
  final NotificationScreenRemoteDataSource remoteDataSource;

  NotificationScreenRepositoryImpl({
    required this.tokenManager,
    required this.remoteDataSource,
  });

  @override
  Future<List<NotificationModel>> getNotifications({int? page}) async {
    try {
      final token = tokenManager.getAccessToken();
      if (token != null) {
        return await remoteDataSource.getNotifications(
          page: page,
          token: token,
        );
      } else {
        throw "Access Token Not Found!";
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> markNotificationAsRead({required int id}) async {
    try {
      final token = tokenManager.getAccessToken();
      if (token != null) {
        await remoteDataSource.markNotificationAsRead(
          token: token,
          id: id,
        );
      } else {
        throw "Access Token Not Found!";
      }
    } catch (e) {
      rethrow;
    }
  }
}
