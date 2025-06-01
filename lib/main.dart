import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:najati_test/register.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _setupNotificationPermissions();
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Africa/Cairo'));

  await _initializeNotifications();

  runApp(const MyApp());
}

Future<void> _setupNotificationPermissions() async {
  if (Platform.isIOS) {
    final result = await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(alert: true, badge: true, sound: true);
    print('iOS permission granted: $result');
  } else {
    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
    }
  }
}

Future<void> _initializeNotifications() async {
  try {
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    final iosInit = DarwinInitializationSettings(
      defaultPresentSound: true,
      requestSoundPermission: true,
      defaultPresentAlert: true,
      requestAlertPermission: true,
      notificationCategories: [
        DarwinNotificationCategory(
          
          'najatiTest',
          actions: [
            DarwinNotificationAction.plain('id_1', 'Action 1'),
            DarwinNotificationAction.plain(
              'id_2',
              'Action 2',
              options: {DarwinNotificationActionOption.destructive},
            ),
            DarwinNotificationAction.plain(
              'id_3',
              'Action 3',
              options: {DarwinNotificationActionOption.foreground},
            ),
          ],
          options: {DarwinNotificationCategoryOption.hiddenPreviewShowTitle},
        )
      ],
    );

    final initSettings = InitializationSettings(android: androidInit, iOS: iosInit);
    await flutterLocalNotificationsPlugin.initialize(initSettings);

    const androidChannel = AndroidNotificationChannel(
      'prayer_channel',
      'Prayer Notifications',
      description: 'تذكير بمواقيت الصلاة اليومية',
      importance: Importance.max,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidChannel);

    await _scheduleDailyPrayerNotifications();
  } catch (e, stack) {
    print('🔥 Error initializing notifications: $e\n$stack');
  }
}

Future<void> _scheduleDailyPrayerNotifications() async {
  final prayers = {
    "الفجر": "21:03",
    "الظهر": "14:09",
    "العصر": "14:15",
    "المغرب": "23:26",
    "العشاء": "23:21",
  };

  for (var entry in prayers.entries) {
    try {
      final time = entry.value.split(":");
      final hour = int.parse(time[0]);
      final minute = int.parse(time[1]);

      await flutterLocalNotificationsPlugin.zonedSchedule(
        entry.key.hashCode,
        "موعد الصلاة",
        "حان الآن موعد صلاة ${entry.key}",
        _nextInstanceOf(hour, minute),
        const NotificationDetails(
          iOS: DarwinNotificationDetails(
            presentSound: true,

          ),
          android: AndroidNotificationDetails(
            'prayer_channel',
            'Prayer Notifications',
            channelDescription: 'تذكير بمواقيت الصلاة اليومية',
            importance: Importance.max,
            priority: Priority.high,
          ),
        ),

        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
      );
    } catch (e, stack) {
      print('🔥 Failed to schedule ${entry.key}: $e\n$stack');
    }
  }
}

tz.TZDateTime _nextInstanceOf(int hour, int minute) {
  final now = tz.TZDateTime.now(tz.local);
  var scheduled = tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);
  if (scheduled.isBefore(now)) {
    scheduled = scheduled.add(const Duration(days: 1));
  }
  return scheduled;
}

late double screenW;
late double screenH;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    screenW = MediaQuery.sizeOf(context).width;
    screenH = MediaQuery.sizeOf(context).height;
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFDEE9FD),
        canvasColor: const Color(0xFFDEE9FD),
      ),
      home:  Register(),
      debugShowCheckedModeBanner: false,
    );
  }
}
