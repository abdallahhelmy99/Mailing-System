import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// ignore: depend_on_referenced_packages
import 'package:timezone/timezone.dart' as tz;
// ignore: depend_on_referenced_packages
import 'package:timezone/data/latest.dart' as tz_data;

abstract class NotificationFactory {
  Future<void> createNotification(String body, String title);
}

class LoginNotificationFactory implements NotificationFactory {
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin;

  LoginNotificationFactory(this._localNotificationsPlugin);

  @override
  Future<void> createNotification(String body, String title) async {
    tz_data.initializeTimeZones();
    final scheduleTime = tz.TZDateTime.fromMillisecondsSinceEpoch(
      tz.local,
      DateTime.now().millisecondsSinceEpoch + 100,
    );
    const androidDetail = AndroidNotificationDetails(
      "0",
      "login",
      visibility: NotificationVisibility.public,
      colorized: true,
      color: Color(0xFFFF9000),
      priority: Priority.high,
      enableLights: true,
      styleInformation: BigTextStyleInformation(""),
      ongoing: true,
      playSound: true
    );

    const noticeDetail = NotificationDetails(
      android: androidDetail,
    );

    await _localNotificationsPlugin.zonedSchedule(
      0,
      title,
      body,
      scheduleTime,
      noticeDetail,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }
}

class EmailNotificationFactory implements NotificationFactory {
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin;

  EmailNotificationFactory(this._localNotificationsPlugin);

  @override
  Future<void> createNotification(String body, String title) async {
    tz_data.initializeTimeZones();
    final scheduleTime = tz.TZDateTime.fromMillisecondsSinceEpoch(
      tz.local,
      DateTime.now().millisecondsSinceEpoch + 250,
    );
    const androidDetail = AndroidNotificationDetails(
      "1",
      "email",
      visibility: NotificationVisibility.public,
      colorized: true,
      priority: Priority.high,
      enableLights: true,
      styleInformation: BigTextStyleInformation(""),
      ongoing: true,
      playSound: true
    );

    const noticeDetail = NotificationDetails(
      android: androidDetail,
    );

    await _localNotificationsPlugin.zonedSchedule(
      0,
      title,
      body,
      scheduleTime,
      noticeDetail,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }
}