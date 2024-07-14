import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:on_a_trip/common/constants/colors.dart';
import 'package:on_a_trip/common/helper/calculate_notification_time.dart';
import 'package:on_a_trip/common/helper/utils.dart';
import 'package:on_a_trip/common/widgets/custom_appbar.dart';
import 'package:on_a_trip/features/notification_screen/presentation/provider/notification_screen_provider.dart';
import 'package:on_a_trip/features/notification_screen/presentation/screens/notification_detail_screen.dart';
import 'package:on_a_trip/features/notification_screen/presentation/widget/notification_tile_widget.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      getNotifications();
    });
  }

  Future<void> getNotifications() async {
    try {
      await Provider.of<NotificationScreenProvider>(context, listen: false).getNotifications();
    } catch (e) {
      Utils.showSnackBar(context, content: e.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          SizedBox(height: 24.h),
          const Text(
            "Notifications",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: CustomColors.titleColor,
            ),
          ),
          SizedBox(height: 16.h),
          Consumer<NotificationScreenProvider>(
            builder: (context, notificationScreenProvider, child) {
              return (notificationScreenProvider.isLoading)
                  ? SizedBox(
                      height: 240.h,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: CustomColors.primaryColor,
                        ),
                      ),
                    )
                  : (notificationScreenProvider.notifications.isEmpty)
                      ? const SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              SizedBox(height: 56),
                              Text(
                                "No Notifications",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "You have no notifications yet!",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: CustomColors.highlightText,
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: notificationScreenProvider.notifications.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            final data = notificationScreenProvider.notifications[index];
                            return NotificationTileWidget(
                              onTap: () async {
                                try {
                                  await notificationScreenProvider.markAsRead(data.id!);
                                  await Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => NotificationDetailScreen(
                                        title: data.title ?? "N/A",
                                        description: data.description ?? "N/A",
                                        imageUrl: data.image != "" ? data.image! : "https://img.freepik.com/premium-vector/photo-icon-picture-icon-image-sign-symbol-vector-illustration_64749-4409.jpg?size=338&ext=jpg&ga=GA1.1.2008272138.1720828800&semt=sph",
                                        createdAt: data.createdAt == null ? "N/A" : DateFormat.yMMMEd().format(data.createdAt!),
                                      ),
                                    ),
                                  );
                                  await getNotifications();
                                } catch (e) {
                                  Utils.showSnackBar(context, content: e.toString());
                                }
                              },
                              seen: data.seen == 1,
                              title: data.title ?? "N/A",
                              subTitle: data.description ?? "N/A",
                              subSubTitle: CalculateNotificationTime.timeAgo(data.createdAt!),
                              imageUrl: data.image != "" ? data.image! : "https://img.freepik.com/premium-vector/photo-icon-picture-icon-image-sign-symbol-vector-illustration_64749-4409.jpg?size=338&ext=jpg&ga=GA1.1.2008272138.1720828800&semt=sph",
                            );
                          },
                        );
            },
          )
        ],
      ),
    );
  }
}
