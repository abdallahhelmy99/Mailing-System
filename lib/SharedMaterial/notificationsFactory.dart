import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// ignore: depend_on_referenced_packages
import 'package:timezone/timezone.dart' as tz;
// ignore: depend_on_referenced_packages
import 'package:timezone/data/latest.dart' as tz_data;

abstract class NotificationFactory {
  Future<void> createNotification(String body, String title);
  Future<void> notifiySetup() async {
    const androidSetting = AndroidInitializationSettings('@mipmap/ic_launcher');
    final _localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    // #2
    const initSettings = InitializationSettings(android: androidSetting);

    // #3
    await _localNotificationsPlugin.initialize(initSettings).then((_) {
      debugPrint('setupPlugin: setup success');
    }).catchError((Object error) {
      debugPrint('Error: $error');
    });
  }
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
    const androidDetail = AndroidNotificationDetails("0", "login",
        visibility: NotificationVisibility.public,
        colorized: true,
        color: Color(0xFFFF9000),
        priority: Priority.high,
        enableLights: true,
        styleInformation: BigTextStyleInformation(""),
        ongoing: true,
        playSound: true);

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

  @override
  Future<void> notifiySetup() async {
    const androidSetting = AndroidInitializationSettings('@mipmap/ic_launcher');
    final _localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    // #2
    const initSettings = InitializationSettings(android: androidSetting);

    // #3
    await _localNotificationsPlugin.initialize(initSettings).then((_) {
      debugPrint('setupPlugin: setup success');
    }).catchError((Object error) {
      debugPrint('Error: $error');
    });
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
    const androidDetail = AndroidNotificationDetails("1", "email",
        visibility: NotificationVisibility.public,
        colorized: true,
        priority: Priority.high,
        enableLights: true,
        styleInformation: BigTextStyleInformation(""),
        ongoing: true,
        playSound: true);

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

  @override
  Future<void> notifiySetup() async {
    const androidSetting = AndroidInitializationSettings('@mipmap/ic_launcher');
    final _localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    // #2
    const initSettings = InitializationSettings(android: androidSetting);

    // #3
    await _localNotificationsPlugin.initialize(initSettings).then((_) {
      debugPrint('setupPlugin: setup success');
    }).catchError((Object error) {
      debugPrint('Error: $error');
    });
  }
}
