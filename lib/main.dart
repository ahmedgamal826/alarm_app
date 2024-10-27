// import 'package:alarm_app/utils/alarm_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:provider/provider.dart';
// import 'package:timezone/data/latest_all.dart' as tz;

// import 'home_page.dart';

// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   tz.initializeTimeZones();
//   flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin>()!
//       .requestNotificationsPermission();

//   runApp(ChangeNotifierProvider(
//     create: (contex) => alarmProvider(),
//     child: const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: AlarmApp(),
//     ),
//   ));
// }

// class AlarmApp extends StatelessWidget {
//   const AlarmApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }

import 'dart:async';
import 'package:alarm_app/add_alarm.dart';
import 'package:alarm_app/utils/alarm_provider.dart';
import 'package:alarm_app/views/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()!
      .requestNotificationsPermission();

  runApp(ChangeNotifierProvider(
    create: (contex) => AlarmProvider(),
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AlarmApp(),
    ),
  ));
}

class AlarmApp extends StatefulWidget {
  const AlarmApp({super.key});

  @override
  State<AlarmApp> createState() => _MyAppState();
}

class _MyAppState extends State<AlarmApp> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
