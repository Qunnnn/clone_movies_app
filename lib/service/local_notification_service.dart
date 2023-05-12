import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  NotificationService();
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Future<void> init() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@drawable/ic_stat_movie_filter');
    DarwinInitializationSettings darwinInitializationSettings =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: onDidReceivelocalNotification,
    );

    final InitializationSettings settings = InitializationSettings(
        android: androidInitializationSettings,
        iOS: darwinInitializationSettings);
    await _flutterLocalNotificationsPlugin.initialize(settings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  NotificationDetails _notificationsDetails() {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channel_id', 'channel_name',
            channelDescription: 'description',
            importance: Importance.high,
            priority: Priority.high,
            playSound: true);
    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails();
    return const NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);
  }

  Future<void> showNotification({
    required id,
    required title,
    required body,
  }) async {
    final details = _notificationsDetails();
    await _flutterLocalNotificationsPlugin.show(id, title, body, details);
  }

  void onDidReceivelocalNotification(
      int id, String? title, String? body, String? payload) {
    print('id: $id');
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;

    // await Navigator.push(
    //   // MaterialPageRoute<void>(builder: (context) => SecondScreen(payload)),
    // );
  }
}
