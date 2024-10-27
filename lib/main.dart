import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:alarm_app/utils/alarm_provider.dart';
import 'package:alarm_app/views/home_page.dart';

void main() {
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
