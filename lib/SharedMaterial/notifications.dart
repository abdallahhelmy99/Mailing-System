
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// // ignore: depend_on_referenced_packages
// import 'package:timezone/timezone.dart' as tz;
// import 'package:timezone/data/latest.dart' as tz_data;

// class Notifications {
//   final _localNotificationsPlugin = FlutterLocalNotificationsPlugin();

//   Future<void> setup() async {
//     const androidSetting = AndroidInitializationSettings('@mipmap/ic_launcher');
//     const initSettings = InitializationSettings(android: androidSetting);
//     await _localNotificationsPlugin.initialize(initSettings).then((_) {
//       debugPrint('setupPlugin: setup success');
//     }).catchError((Object error) {
//       debugPrint('Error: $error');
//     });
//   }

//   Future<void> addNotification(String notiBody , String notiTitle) async {
//     tz_data.initializeTimeZones();
//     final scheduleTime =tz.TZDateTime.fromMillisecondsSinceEpoch(tz.local,  DateTime.now().millisecondsSinceEpoch + 250);
//     const androidDetail = AndroidNotificationDetails(
//         "0", 
//         "mails",
//         visibility: NotificationVisibility.public,
//         colorized: true,
//         priority: Priority.high,
//         enableLights: true,
//         styleInformation: BigTextStyleInformation(""),
//         ongoing: true
//         );

//     const noticeDetail = NotificationDetails(
//       android: androidDetail,
//     );

//     await _localNotificationsPlugin.zonedSchedule(
//       0,
//       notiTitle,
//       notiBody,
//       scheduleTime,
//       noticeDetail,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       androidAllowWhileIdle: true,
//     );
//   }
// }
