// // // // import 'package:alarm_app/notification_helper.dart';
// // // // import 'package:flutter/material.dart';

// // // // class NotificationScreen extends StatelessWidget {
// // // //   const NotificationScreen({super.key});

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text('Schudle Notification'),
// // // //       ),
// // // //       body: Center(
// // // //         child: ElevatedButton(
// // // //           onPressed: () {
// // // //             NotificationHelper.scheduleNotification(
// // // //               'Schudled',
// // // //               'Hi, Ahmed Elnemr',
// // // //             );
// // // //           },
// // // //           child: Text(
// // // //             'Schudle Now',
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // import 'package:timezone/data/latest.dart' as tz;
// // // import 'package:timezone/timezone.dart' as tz;
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// // // class NotificationScreen extends StatefulWidget {
// // //   @override
// // //   NotificationScreen createState() => NotificationScreen();
// // // }

// // // class _NotificationScreen extends State<NotificationScreen> {
// // //   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// // //       FlutterLocalNotificationsPlugin();

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     // Initialize notification settings
// // //     final initializationSettingsAndroid =
// // //         AndroidInitializationSettings('@mipmap/ic_launcher');
// // //     final initializationSettings = InitializationSettings(
// // //       android: initializationSettingsAndroid,
// // //     );
// // //     flutterLocalNotificationsPlugin.initialize(initializationSettings);
// // //   }

// // //   // Schedule a notification after 15 seconds
// // //   Future<void> scheduleNotification() async {
// // //     const androidDetails = AndroidNotificationDetails(
// // //       'channel_id',
// // //       'channel_name',
// // //       importance: Importance.high,
// // //       priority: Priority.high,
// // //     );
// // //     const notificationDetails = NotificationDetails(android: androidDetails);

// // //     await flutterLocalNotificationsPlugin.zonedSchedule(
// // //       0,
// // //       'Notification Title',
// // //       'This is the text of the scheduled notification after 15 seconds',
// // //       DateTime.now().add(Duration(seconds: 15)),
// // //       notificationDetails,
// // //       androidAllowWhileIdle: true,
// // //       uiLocalNotificationDateInterpretation:
// // //           UILocalNotificationDateInterpretation.absoluteTime,
// // //     );
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Schedule Notification After 15 Seconds'),
// // //       ),
// // //       body: Center(
// // //         child: ElevatedButton(
// // //           onPressed: scheduleNotification,
// // //           child: Text('Schedule Notification'),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:timezone/timezone.dart' as tz;
// // import 'package:flutter/material.dart';
// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// // class NotificationScreen extends StatefulWidget {
// //   @override
// //   _NotificationScreenState createState() => _NotificationScreenState();
// // }

// // class _NotificationScreenState extends State<NotificationScreen> {
// //   late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

// //   @override
// //   void initState() {
// //     super.initState();

// //     // Initialize the FlutterLocalNotificationsPlugin
// //     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

// //     // Define Android initialization settings
// //     const androidInitSettings =
// //         AndroidInitializationSettings('@mipmap/ic_launcher');
// //     const initializationSettings = InitializationSettings(
// //       android: androidInitSettings,
// //     );

// //     // Initialize the plugin with the settings
// //     flutterLocalNotificationsPlugin.initialize(initializationSettings);
// //   }

// //   // Schedule a notification after 15 seconds
// //   Future<void> scheduleNotification() async {
// //     const androidDetails = AndroidNotificationDetails(
// //       'channel_id',
// //       'channel_name',
// //       importance: Importance.high,
// //       priority: Priority.high,
// //     );
// //     const notificationDetails = NotificationDetails(android: androidDetails);

// //     // Schedule the notification with TZDateTime
// //     await flutterLocalNotificationsPlugin.zonedSchedule(
// //       0,
// //       'Notification Title',
// //       'This is the text of the scheduled notification after 15 seconds',
// //       tz.TZDateTime.now(tz.local).add(Duration(seconds: 15)),
// //       notificationDetails,
// //       androidAllowWhileIdle: true,
// //       uiLocalNotificationDateInterpretation:
// //           UILocalNotificationDateInterpretation.absoluteTime,
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Schedule Notification After 15 Seconds'),
// //       ),
// //       body: Center(
// //         child: ElevatedButton(
// //           onPressed: scheduleNotification,
// //           child: Text('Schedule Notification'),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'dart:async';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationScreen extends StatefulWidget {
//   @override
//   _NotificationScreenState createState() => _NotificationScreenState();
// }

// class _NotificationScreenState extends State<NotificationScreen> {
//   late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//   int _countdown = 15;
//   Timer? _timer;

//   @override
//   void initState() {
//     super.initState();

//     // Initialize the FlutterLocalNotificationsPlugin
//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//     // Define Android initialization settings
//     const androidInitSettings =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//     const initializationSettings = InitializationSettings(
//       android: androidInitSettings,
//     );

//     // Initialize the plugin with the settings
//     flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }

//   // Start countdown and schedule the notification
//   void startCountdownAndScheduleNotification() {
//     _startCountdown();

//     // Schedule the notification after 15 seconds
//     _scheduleNotification();
//   }

//   // Countdown from 15 to 0
//   void _startCountdown() {
//     setState(() {
//       _countdown = 15;
//     });

//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_countdown > 0) {
//           _countdown--;
//         } else {
//           _timer?.cancel();
//         }
//       });
//     });
//   }

//   // Schedule a notification
//   Future<void> _scheduleNotification() async {
//     const androidDetails = AndroidNotificationDetails(
//       'channel_id',
//       'channel_name',
//       importance: Importance.high,
//       priority: Priority.high,
//     );
//     const notificationDetails = NotificationDetails(android: androidDetails);

//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       0,
//       'Notification Title',
//       'This is the text of the scheduled notification after 15 seconds',
//       tz.TZDateTime.now(tz.local).add(Duration(seconds: 15)),
//       notificationDetails,
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//     );
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Schedule Notification with Countdown'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Notification will appear in:',
//               style: TextStyle(fontSize: 20),
//             ),
//             Text(
//               '$_countdown',
//               style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: startCountdownAndScheduleNotification,
//               child: Text('Start Countdown and Schedule Notification'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  int _countdown = 15;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // Initialize the FlutterLocalNotificationsPlugin
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    // Request permissions for iOS and Android
    _requestPermissions();

    // Define Android initialization settings
    const androidInitSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const initializationSettings = InitializationSettings(
      android: androidInitSettings,
    );

    // Initialize the plugin with the settings
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // Request permissions for notifications
  void _requestPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(alert: true, badge: true, sound: true);
  }

  // Start countdown and schedule the notification
  void startCountdownAndScheduleNotification() {
    _startCountdown();

    // Schedule the notification after 15 seconds
    _scheduleNotification();
  }

  // Countdown from 15 to 0
  void _startCountdown() {
    setState(() {
      _countdown = 15;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdown > 0) {
          _countdown--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  // Schedule a notification
  Future<void> _scheduleNotification() async {
    const androidDetails = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.high,
      priority: Priority.high,
      playSound: true,
    );
    const notificationDetails = NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Notification Title',
      'This is the text of the scheduled notification after 15 seconds',
      tz.TZDateTime.now(tz.local).add(Duration(seconds: 15)),
      notificationDetails,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule Notification with Countdown'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Notification will appear in:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$_countdown',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: startCountdownAndScheduleNotification,
              child: Text('Start Countdown and Schedule Notification'),
            ),
          ],
        ),
      ),
    );
  }
}
