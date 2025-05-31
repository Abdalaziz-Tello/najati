import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:najati_test/counter.dart';
import 'package:najati_test/features/verify2.dart';
import 'package:permission_handler/permission_handler.dart';
//import 'package:hive/hive.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:path_provider/path_provider.dart';
import 'package:najati_test/get_child.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:najati_test/services/noti_service.dart';
//import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:timezone/timezone.dart' as tz;

import 'package:najati_test/verify.dart';

import 'bubble.dart';
import 'clip.dart';
import 'create_child.dart';
import 'education.dart';
import 'register.dart';
import 'select_story.dart';
import 'smile.dart';
import 'top_student.dart';
import 'tte.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ///////await LocalNotificationService.init();
  //  await setupAndScheduleNotification();
  // await flutterLocalNotificationsPlugin
  //     .resolvePlatformSpecificImplementation<
  //       AndroidFlutterLocalNotificationsPlugin
  //     >()!
  //     .requestNotificationsPermission();
  //await Hive.initFlutter();
  //Bloc.observer = MyBlocObserver();
  // await Hive.openBox('authBox');

  try {
    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
    }

    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Africa/Cairo'));

    await initializeNotifications();
  } catch (e, stack) {
    print('🔥 Error during main initialization: $e\n$stack');
  }

  runApp(const MyApp());
}

Future<void> initializeNotifications() async {
  try {
    const AndroidInitializationSettings androidInit =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings = InitializationSettings(
      android: androidInit,
    );

    await flutterLocalNotificationsPlugin.initialize(initSettings);

    final androidNotificationChannel = AndroidNotificationChannel(
      'prayer_channel',
      'Prayer Notifications',
      description: 'تذكير بمواقيت الصلاة اليومية',
      importance: Importance.max,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(androidNotificationChannel);

    await scheduleDailyPrayerNotifications();
  } catch (e, stack) {
    print('🔥 Error during notification initialization: $e\n$stack');
  }
}

Future<void> scheduleDailyPrayerNotifications() async {
  final prayers = <String, String>{
    "الفجر": "21:03",
    "الظهر": "14:09",
    "العصر": "14:15",
    "المغرب": "21:25",
    "العشاء": "16:46",
  };

  for (var entry in prayers.entries) {
    try {
      final timeParts = entry.value.split(":");
      final hour = int.parse(timeParts[0]);
      final minute = int.parse(timeParts[1]);

      await flutterLocalNotificationsPlugin.zonedSchedule(
        entry.key.hashCode,
        "موعد الصلاة",
        "حان الآن موعد صلاة ${entry.key}",
        _nextInstanceOf(hour, minute),
        const NotificationDetails(
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
  var scheduled = tz.TZDateTime(
    tz.local,
    now.year,
    now.month,
    now.day,
    hour,
    minute,
  );
  if (scheduled.isBefore(now)) {
    scheduled = scheduled.add(const Duration(days: 1));
  }
  return scheduled;
}
// ** تم التعليق على خدمة الخلفية كاملة **
/*
Future<void> initializeService() async {
  final service = FlutterBackgroundService();
  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: true,
      isForegroundMode: true,
      notificationChannelId: 'prayer_channel',
      initialNotificationTitle: 'Najati App',
      initialNotificationContent: 'تشغيل في الخلفية لتذكير الصلاة',
      foregroundServiceNotificationId: 888,
    ),
    iosConfiguration: IosConfiguration(),
  );

  await service.startService();
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();

  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }

  tz.initializeTimeZones();
  await initializeNotifications();
  await scheduleDailyPrayerNotifications();
}
*/

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
      home: Register(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter_background_service/flutter_background_service.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:najati_test/counter.dart';
// import 'package:najati_test/features/verify2.dart';
// //import 'package:hive/hive.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:path_provider/path_provider.dart';
// import 'package:najati_test/get_child.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:najati_test/services/noti_service.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/timezone.dart' as tz;

// import 'package:najati_test/verify.dart';

// import 'bubble.dart';
// import 'clip.dart';
// import 'create_child.dart';
// import 'education.dart';
// import 'register.dart';
// import 'select_story.dart';
// import 'smile.dart';
// import 'top_student.dart';

// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//         AndroidFlutterLocalNotificationsPlugin
//       >()!
//       .requestNotificationsPermission();
//   await Hive.initFlutter();
//   //Bloc.observer = MyBlocObserver();
//   await Hive.openBox('authBox');
//   await initializeNotifications();
//   await initializeService();
//   tz.initializeTimeZones();
//   //await initializeNotifications();

//   runApp(const MyApp());
// }

// Future<void> initializeService() async {
//   final service = FlutterBackgroundService();
//   await service.configure(
//     androidConfiguration: AndroidConfiguration(
//       onStart: onStart,
//       autoStart: true,
//       isForegroundMode: true,
//       notificationChannelId: 'prayer_channel',
//       initialNotificationTitle: 'Najati App',
//       initialNotificationContent: 'تشغيل في الخلفية لتذكير الصلاة',
//       foregroundServiceNotificationId: 888, // ✅ أضف هذا لتحديد رقم فريد
//     ),
//     iosConfiguration: IosConfiguration(),
//   );

//   await service.startService();
// }

// @pragma('vm:entry-point')
// void onStart(ServiceInstance service) async {
//   DartPluginRegistrant.ensureInitialized();

//   if (service is AndroidServiceInstance) {
//     service.on('setAsForeground').listen((event) {
//       service.setAsForegroundService();
//     });

//     service.on('setAsBackground').listen((event) {
//       service.setAsBackgroundService();
//     });
//   }

//   tz.initializeTimeZones();
//   await initializeNotifications();
//   await scheduleDailyPrayerNotifications();
// }

// Future<void> initializeNotifications() async {
//   const AndroidInitializationSettings androidInit =
//       AndroidInitializationSettings('@mipmap/ic_launcher');

//   const InitializationSettings initSettings = InitializationSettings(
//     android: androidInit,
//   );

//   await flutterLocalNotificationsPlugin.initialize(initSettings);

//   final androidNotificationChannel = AndroidNotificationChannel(
//     'prayer_channel',
//     'Prayer Notifications',
//     description: 'تذكير بمواقيت الصلاة اليومية',
//     importance: Importance.max,
//   );

//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//         AndroidFlutterLocalNotificationsPlugin
//       >()
//       ?.createNotificationChannel(androidNotificationChannel);
// }

// Future<void> scheduleDailyPrayerNotifications() async {
//   final prayers = <String, String>{
//     "الفجر": "05:00",
//     "الظهر": "10:15",
//     "العصر": "10:40",
//     "المغرب": "12:06",
//     "العشاء": "11:00",
//   };

//   for (var entry in prayers.entries) {
//     final timeParts = entry.value.split(":");
//     final hour = int.parse(timeParts[0]);
//     final minute = int.parse(timeParts[1]);
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       entry.key.hashCode,
//       "موعد الصلاة",
//       "حان الآن موعد صلاة ${entry.key}",
//       _nextInstanceOf(hour, minute),
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           'prayer_channel',
//           'Prayer Notifications',
//           channelDescription: 'تذكير بمواقيت الصلاة اليومية',
//           importance: Importance.max,
//           priority: Priority.high,
//         ),
//       ),
//       androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
//       matchDateTimeComponents: DateTimeComponents.time,
//     );
//   }
// }

// tz.TZDateTime _nextInstanceOf(int hour, int minute) {
//   final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
//   tz.TZDateTime scheduled = tz.TZDateTime(
//     tz.local,
//     now.year,
//     now.month,
//     now.day,
//     hour,
//     minute,
//   );
//   if (scheduled.isBefore(now)) {
//     scheduled = scheduled.add(Duration(days: 1));
//   }
//   return scheduled;
// }

// late double screenW;
// late double screenH;

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     screenW = MediaQuery.sizeOf(context).width;
//     screenH = MediaQuery.sizeOf(context).height;
//     return MaterialApp(
//       theme: ThemeData(
//         scaffoldBackgroundColor: const Color(0xFFDEE9FD),
//         // Optional: Also set this color as the default background for all Material widgets
//         canvasColor: const Color(0xFFDEE9FD),
//       ),

//       home: CounterWidget(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// // void backgroundPrayerUpdate() async {
// //   await NotificationService.initialize();
// //   await PrayerScheduler.scheduleDailyPrayers();
// // }
