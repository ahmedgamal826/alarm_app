// // import 'package:flutter/material.dart';
// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// // import 'package:timezone/timezone.dart' as tz;

// // class NotificationHome extends StatefulWidget {
// //   @override
// //   _NotificationHomeState createState() => _NotificationHomeState();
// // }

// // class _NotificationHomeState extends State<NotificationHome> {
// //   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// //       FlutterLocalNotificationsPlugin();

// //   @override
// //   void initState() {
// //     super.initState();
// //     _initializeNotifications();
// //   }

// //   Future<void> _initializeNotifications() async {
// //     const AndroidInitializationSettings initializationSettingsAndroid =
// //         AndroidInitializationSettings('@mipmap/ic_launcher');
// //     const InitializationSettings initializationSettings =
// //         InitializationSettings(android: initializationSettingsAndroid);

// //     await flutterLocalNotificationsPlugin.initialize(initializationSettings);
// //   }

// //   Future<void> _scheduleNotification() async {
// //     // تأخير 10 ثوانٍ
// //     final scheduledDate =
// //         tz.TZDateTime.now(tz.local).add(Duration(seconds: 10));

// //     // إعداد الإشعار
// //     await flutterLocalNotificationsPlugin.zonedSchedule(
// //       0,
// //       'تذكير',
// //       'هذا هو الإشعار بعد 10 ثوانٍ!',
// //       scheduledDate,
// //       const NotificationDetails(
// //         android: AndroidNotificationDetails(
// //           'your_channel_id',
// //           'your_channel_name',
// //           channelDescription: 'وصف القناة',
// //           importance: Importance.max,
// //           priority: Priority.high,
// //         ),
// //       ),
// //       androidAllowWhileIdle: true,
// //       uiLocalNotificationDateInterpretation:
// //           UILocalNotificationDateInterpretation.absoluteTime,
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Notification Demo')),
// //       body: Center(
// //         child: ElevatedButton(
// //           onPressed: () {
// //             _scheduleNotification();
// //             ScaffoldMessenger.of(context).showSnackBar(
// //               SnackBar(content: Text('الإشعار سيتم عرضه بعد 10 ثوانٍ')),
// //             );
// //           },
// //           child: Text('عرض الإشعار بعد 10 ثوانٍ'),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:permission_handler/permission_handler.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationHome extends StatefulWidget {
//   @override
//   _NotificationHomeState createState() => _NotificationHomeState();
// }

// class _NotificationHomeState extends State<NotificationHome> {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   @override
//   void initState() {
//     super.initState();
//     _initializeNotifications();
//   }

//   Future<void> _initializeNotifications() async {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//     const InitializationSettings initializationSettings =
//         InitializationSettings(android: initializationSettingsAndroid);

//     await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }

//   Future<void> requestExactAlarmPermission() async {
//     if (await Permission.scheduleExactAlarm.request().isGranted) {
//       // الإذن ممنوح، يمكنك جدولة الإشعار
//     } else {
//       // الإذن غير ممنوح، اعرض رسالة توضيحية للمستخدم
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//             content:
//                 Text('الرجاء السماح بالإشعارات الدقيقة في إعدادات التطبيق.')),
//       );
//     }
//   }

//   Future<void> _scheduleNotification() async {
//     final scheduledDate =
//         tz.TZDateTime.now(tz.local).add(Duration(seconds: 10));

//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       0,
//       'تذكير',
//       'هذا هو الإشعار بعد 10 ثوانٍ!',
//       scheduledDate,
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           'your_channel_id',
//           'your_channel_name',
//           channelDescription: 'وصف القناة',
//           importance: Importance.max,
//           priority: Priority.high,
//         ),
//       ),
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Notification Demo')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             await requestExactAlarmPermission(); // طلب الإذن أولاً
//             _scheduleNotification();
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text('الإشعار سيتم عرضه بعد 10 ثوانٍ')),
//             );
//           },
//           child: Text('عرض الإشعار بعد 10 ثوانٍ'),
//         ),
//       ),
//     );
//   }
// }

// import 'package:timezone/data/latest_all.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationHelper {
//   static final FlutterLocalNotificationsPlugin notification =
//       FlutterLocalNotificationsPlugin();

//   static init() {
//     notification.initialize(
//       InitializationSettings(
//         android: AndroidInitializationSettings(
//           String.fromEnvironment(
//             '@mipmap/ic_launcher',
//           ),
//         ),
//         iOS: DarwinInitializationSettings(),
//       ),
//     );

//     tz.initializeTimeZones();
//   }

//   static schudleNotification(String body, String title) {
//     var androidDetails = AndroidNotificationDetails(
//       'important_notification',
//       'My Channel',
//       importance: Importance.max,
//       priority: Priority.high,
//     );

//     var iosDetails = const DarwinNotificationDetails();

//     var notificationDetails = NotificationDetails(
//       android: androidDetails,
//       iOS: iosDetails,
//     );

//     notification.zonedSchedule(
//       0,
//       title,
//       body,
//       tz.TZDateTime.now(tz.local).add(
//         const Duration(seconds: 10),
//       ),
//       notificationDetails,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
//     );
//   }
// }

import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper {
  static final FlutterLocalNotificationsPlugin notification =
      FlutterLocalNotificationsPlugin();

  static init() {
    notification.initialize(
      InitializationSettings(
        android: AndroidInitializationSettings(
            '@mipmap/ic_launcher'), // Use literal string for icon
        iOS: DarwinInitializationSettings(),
      ),
    );

    tz.initializeTimeZones();
  }

  static scheduleNotification(String body, String title) {
    var androidDetails = AndroidNotificationDetails(
      'important_notification',
      'My Channel',
      importance: Importance.max,
      priority: Priority.high,
    );

    var iosDetails = const DarwinNotificationDetails();

    var notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    notification.zonedSchedule(
      0,
      title,
      body,
      tz.TZDateTime.now(tz.local).add(
        const Duration(seconds: 10),
      ),
      notificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents
          .time, // Optionally, ensure datetime components match
    );
  }
}
