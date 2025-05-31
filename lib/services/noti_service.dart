// // lib/services/notification_service.dart
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
// // lib/services/notification_service.dart
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

// class NotificationService {
//   static final _plugin = FlutterLocalNotificationsPlugin();

//   static Future<void> initialize() async {
//     const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
//     const settings = InitializationSettings(android: androidInit);
//     await _plugin.initialize(settings);
//     tz.initializeTimeZones();
//   }

//   static Future<void> schedulePrayerNotification({
//     required String prayerName,
//     required DateTime dateTime,
//     required int id,
//   }) async {
//     final tzTime = tz.TZDateTime.from(dateTime, tz.local);

//     await _plugin.zonedSchedule(
//       id,
//       'موعد صلاة $prayerName',
//       'حان وقت صلاة $prayerName',
//       tzTime,
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           'prayer_channel_id',
//           'Prayer Notifications',
//           channelDescription: 'تذكير بمواقيت الصلاة',
//           importance: Importance.max,
//           priority: Priority.high,
//         ),
//       ),
//       androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle, // محدث
//       matchDateTimeComponents: DateTimeComponents.time, // لتكرار يومي
//     );
//   }

//   static Future<void> cancelAllNotifications() async {
//     await _plugin.cancelAll();
//   }
// }
