import 'dart:convert';

import 'package:on_a_trip/common/constants/endpoints.dart';
import 'package:on_a_trip/common/helper/http_services.dart';
import 'package:on_a_trip/features/notification_screen/data/models/notification_model.dart';

class NotificationScreenRemoteDataSource {
  final HttpService _httpService;

  NotificationScreenRemoteDataSource({
    required HttpService httpService,
  }) : _httpService = httpService;

  Future<List<NotificationModel>> getNotifications({
    int? page,
    required String token,
  }) async {
    try {
      String url = "${Endpoints.notificationApi}?type=getAllNotification";
      if (page != null) {
        url += "&page=$page";
      }
      final response = await _httpService.get(
        url: url,
        headers: {
          "Authorization": "Bearer $token",
        },
      );

      List<NotificationModel> notifications = List.generate(
        response["data"].length,
        (index) => NotificationModel.fromJson(
          response["data"][index],
        ),
      ).toList();

      return notifications;
    } catch (e) {
      final error = json.decode(e.toString());
      if (error["errorMessage"] != null) {
        throw error["errorMessage"].toString();
      } else {
        rethrow;
      }
    }
  }

  Future<void> markNotificationAsRead({
    required int id,
    required String token,
  }) async {
    try {
      final url = "${Endpoints.notificationApi}?type=getNotification&id=$id";
      await _httpService.get(
        url: url,
        headers: {
          "Authorization": "Bearer $token",
        },
      );
    } catch (e) {
      final error = json.decode(e.toString());
      if (error["errorMessage"] != null) {
        throw error["errorMessage"].toString();
      } else {
        rethrow;
      }
    }
  }
}
