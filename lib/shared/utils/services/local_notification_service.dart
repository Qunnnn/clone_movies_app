import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

class NotificationService {
  NotificationService._internal();
  static final NotificationService _notificationService =
      NotificationService._internal();
  static NotificationService get instance => _notificationService;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final StreamController streamController = StreamController();

  Stream get getStream => streamController.stream;

  Future<void> intialize() async {
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

//Schedule Daily Notification
  Future<void> scheduleDailyNotification({
    required id,
    required title,
    required body,
    required hour,
    required minute,
    required payload,
  }) async {
    final details = _notificationsDetails();

    await _flutterLocalNotificationsPlugin.zonedSchedule(
        id, title, body, _nextInstanceOfDailyTime(hour, minute), details,
        payload: payload,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  tz.TZDateTime _nextInstanceOfDailyTime(hour, minute) {
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

//Schedule Specific Time Notification

  // Future<void> scheduleSpecificTimeNotification({
  //   required id,
  //   required title,
  //   required body,
  //   required hour,
  //   required minute,
  // }) async {
  //   final details = _notificationsDetails();
  //   await _flutterLocalNotificationsPlugin.zonedSchedule(
  //       id, title, body, _nextInstanceOfSpecificTime(hour, minute), details,
  //       androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
  //       uiLocalNotificationDateInterpretation:
  //           UILocalNotificationDateInterpretation.absoluteTime,
  //       matchDateTimeComponents: DateTimeComponents.time);
  // }

  // tz.TZDateTime _nextInstanceOfSpecificTime(hour, minute) {
  //   final tz.TZDateTime now =
  //       tz.TZDateTime.now(tz.getLocation('Asia/Ho_Chi_Minh'));
  //   tz.TZDateTime scheduledDate = tz.TZDateTime(
  //       tz.getLocation('Asia/Ho_Chi_Minh'),
  //       now.year,
  //       now.month,
  //       now.day,
  //       hour,
  //       minute);
  //   return scheduledDate;
  // }

//Cancel Notification
  Future<void> cancelNotification({required id}) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }

  void onDidReceivelocalNotification(
    int id,
    String? title,
    String? body,
    String? payload,
  ) {}

  onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    // Retrieve the payload from the notification response

    final String? payload = notificationResponse.payload;
    if (payload != null && payload.isNotEmpty) {
      debugPrint('notification payload: $payload');
      streamController.sink.add(payload);
    }
  }

  close() {
    streamController.close();
  }
}
