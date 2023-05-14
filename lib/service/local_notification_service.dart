import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

class NotificationService {
  NotificationService();
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Future<void> init() async {
    tz.initializeTimeZones();
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

  Future<void> scheduleDailyNotification({
    required id,
    required title,
    required body,
    required hour,
    required minute,
  }) async {
    final details = _notificationsDetails();

    await _flutterLocalNotificationsPlugin.zonedSchedule(
        id, title, body, _nextInstanceOfTime(hour, minute), details,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  tz.TZDateTime _nextInstanceOfTime(hour, minute) {
    final tz.TZDateTime now =
        tz.TZDateTime.now(tz.getLocation('Asia/Ho_Chi_Minh'));
    tz.TZDateTime scheduledDate = tz.TZDateTime(
        tz.getLocation('Asia/Ho_Chi_Minh'),
        now.year,
        now.month,
        now.day,
        hour,
        minute);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  void onDidReceivelocalNotification(
      int id, String? title, String? body, String? payload) {}

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;

    // await Navigator.push(
    //   // MaterialPageRoute<void>(builder: (context) => SecondScreen(payload)),
    // );
  }
}
