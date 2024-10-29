import 'package:alarm_app/notification_Screen.dart';
import 'package:alarm_app/notification_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:alarm_app/utils/alarm_provider.dart';
import 'package:alarm_app/views/home_page.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationHelper.init();

  tz.initializeTimeZones(); // تهيئة المناطق الزمنية

  runApp(
    ChangeNotifierProvider(
      create: (context) => AlarmProvider(),
      child: const AlarmApp(),
    ),
  );
}

class AlarmApp extends StatelessWidget {
  const AlarmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // Set HomePage as the main screen
    );
  }
}
