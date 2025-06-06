// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class LocalNotificationService {
//   static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   static Future<void> init() async {
//     final InitializationSettings settings = InitializationSettings(
//       android: AndroidInitializationSettings('@mipmap/ic_launcher'),
//       iOS: DarwinInitializationSettings(),
//     );
//     await flutterLocalNotificationsPlugin.initialize(
//       settings,
//       onDidReceiveNotificationResponse: onTap,
//       onDidReceiveBackgroundNotificationResponse: onTap,
//     );
//   }

//   static void onTap(NotificationResponse notificationResponse) {}

//   static Future<void> showBasicNotification({
//     required String channelId,
//     required String title,
//     required String body,
//   }) async {
//     final NotificationDetails details = NotificationDetails(
//       android: AndroidNotificationDetails(
//         channelId,
//         'Notifications',
//         importance: Importance.max,
//         priority: Priority.high,
//       ),
//     );
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       title,
//       body,
//       details,
//       payload: 'payloadData',
//     );
//   }

//   static Future<void> showBasicNotificationWhenAnswer() async {
//     await showBasicNotification(
//       channelId: 'id1',
//       title: 'شكراً لمساهمتك',
//       body: 'نقدّر جهودك',
//     );
//   }
// }
