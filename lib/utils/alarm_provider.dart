// // // // import 'dart:convert';
// // // // import 'package:alarm_app/main.dart';
// // // // import 'package:alarm_app/models/alarm_model.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:shared_preferences/shared_preferences.dart';
// // // // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// // // // import 'package:timezone/timezone.dart' as tz;

// // // // import 'package:intl/intl.dart';

// // // // class alarmProvider extends ChangeNotifier {
// // // //   late SharedPreferences preferences;

// // // //   List<AlarmModel> alarmlist = [];

// // // //   List<String> listofstring = [];

// // // //   FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

// // // //   late BuildContext context;

// // // //   SetAlaram(
// // // //     String label,
// // // //     String dateTime,
// // // //     bool check,
// // // //     String repeat,
// // // //     int id,
// // // //     int milliseconds,
// // // //   ) {
// // // //     alarmlist.add(AlarmModel(
// // // //         label: label,
// // // //         dateTime: dateTime,
// // // //         check: check,
// // // //         when: repeat,
// // // //         id: id,
// // // //         milliseconds: milliseconds));
// // // //     notifyListeners();
// // // //   }

// // // //   EditSwitch(int index, bool check) {
// // // //     alarmlist[index].check = check;
// // // //     notifyListeners();
// // // //   }

// // // //   GetData() async {
// // // //     preferences = await SharedPreferences.getInstance();

// // // //     List<String>? cominglist = await preferences.getStringList("data");

// // // //     if (cominglist == null) {
// // // //     } else {
// // // //       alarmlist =
// // // //           cominglist.map((e) => AlarmModel.fromJson(json.decode(e))).toList();
// // // //       notifyListeners();
// // // //     }
// // // //   }

// // // //   SetData() {
// // // //     listofstring = alarmlist.map((e) => json.encode(e.toJson())).toList();
// // // //     preferences.setStringList("data", listofstring);

// // // //     notifyListeners();
// // // //   }

// // // //   // Initialize for notification
// // // //   Inituilize(con) async {
// // // //     context = con;
// // // //     var androidInitilize =
// // // //         new AndroidInitializationSettings('@mipmap/ic_launcher');
// // // //     var iOSinitilize = new DarwinInitializationSettings();
// // // //     var initilizationsSettings =
// // // //         InitializationSettings(android: androidInitilize, iOS: iOSinitilize);
// // // //     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
// // // //     await flutterLocalNotificationsPlugin!.initialize(initilizationsSettings,
// // // //         onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
// // // //   }

// // // //   void onDidReceiveNotificationResponse(
// // // //       NotificationResponse notificationResponse) async {
// // // //     final String? payload = notificationResponse.payload;
// // // //     if (notificationResponse.payload != null) {
// // // //       debugPrint('notification payload: $payload');
// // // //     }
// // // //     await Navigator.push(
// // // //         context, MaterialPageRoute<void>(builder: (context) => AlarmApp()));
// // // //   }

// // // //   ShowNotification() async {
// // // //     const AndroidNotificationDetails androidNotificationDetails =
// // // //         AndroidNotificationDetails(
// // // //       'your channel id',
// // // //       'your channel name',
// // // //       channelDescription: 'your channel description',
// // // //       importance: Importance.max,
// // // //       priority: Priority.high,
// // // //       ticker: 'ticker',
// // // //     );

// // // //     const NotificationDetails notificationDetails =
// // // //         NotificationDetails(android: androidNotificationDetails);
// // // //     await flutterLocalNotificationsPlugin!.show(
// // // //         0, 'plain title', 'plain body', notificationDetails,
// // // //         payload: 'item x');
// // // //   }

// // // //   SecduleNotification(DateTime datetim, int Randomnumber) async {
// // // //     int newtime =
// // // //         datetim.millisecondsSinceEpoch - DateTime.now().millisecondsSinceEpoch;
// // // //     print(datetim.millisecondsSinceEpoch);
// // // //     print(DateTime.now().millisecondsSinceEpoch);
// // // //     print(newtime);
// // // //     await flutterLocalNotificationsPlugin!.zonedSchedule(
// // // //         Randomnumber,
// // // //         'Alarm Clock',
// // // //         "${DateFormat().format(DateTime.now())}",
// // // //         tz.TZDateTime.now(tz.local).add(Duration(milliseconds: newtime)),
// // // //         const NotificationDetails(
// // // //             android: AndroidNotificationDetails(
// // // //                 'your channel id', 'your channel name',
// // // //                 channelDescription: 'your channel description',
// // // //                 sound: RawResourceAndroidNotificationSound("alarm"),
// // // //                 autoCancel: false,
// // // //                 playSound: true,
// // // //                 priority: Priority.max)),
// // // //         androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
// // // //         uiLocalNotificationDateInterpretation:
// // // //             UILocalNotificationDateInterpretation.absoluteTime);
// // // //   }

// // // //   CancelNotification(int notificationid) async {
// // // //     await flutterLocalNotificationsPlugin!.cancel(notificationid);
// // // //   }
// // // // }

// // // import 'dart:convert';
// // // import 'package:alarm_app/main.dart';
// // // import 'package:alarm_app/models/alarm_model.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:shared_preferences/shared_preferences.dart';
// // // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// // // import 'package:timezone/timezone.dart' as tz;
// // // import 'package:intl/intl.dart';

// // // class AlarmProvider extends ChangeNotifier {
// // //   late SharedPreferences preferences;
// // //   List<AlarmModel> alarmList = [];
// // //   FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
// // //   late BuildContext context;

// // //   AlarmProvider() {
// // //     _initializeSharedPreferences();
// // //   }

// // //   Future<void> _initializeSharedPreferences() async {
// // //     preferences = await SharedPreferences.getInstance();
// // //     await getData();
// // //   }

// // //   Future<void> setAlarm(
// // //     String label,
// // //     String dateTime,
// // //     String alarmDate,
// // //     bool check,
// // //     String repeat,
// // //     int id,
// // //     int milliseconds,
// // //   ) async {
// // //     alarmList.add(AlarmModel(
// // //       label: label,
// // //       dateTime: dateTime,
// // //       check: check,
// // //       when: repeat,
// // //       id: id,
// // //       alarmDate: alarmDate,
// // //       milliseconds: milliseconds,
// // //     ));
// // //     await setData();
// // //     notifyListeners();
// // //   }

// // //   Future<void> editSwitch(int index, bool check) async {
// // //     alarmList[index].check = check;
// // //     await setData(); // update sharedpreference
// // //     notifyListeners(); // listener to update ui
// // //   }

// // //   Future<void> removeAlarm(int index) async {
// // //     if (index >= 0 && index < alarmList.length) {
// // //       alarmList.removeAt(index); // Remove the alarm from the list
// // //       await setData(); // Update SharedPreferences
// // //       notifyListeners(); // Notify listeners to update the UI
// // //     }
// // //   }

// // //   // Future<void> getData() async {
// // //   //   List<String>? comingList = preferences.getStringList("data");
// // //   //   if (comingList != null) {
// // //   //     alarmList =
// // //   //         comingList.map((e) => AlarmModel.fromJson(json.decode(e))).toList();
// // //   //     notifyListeners();
// // //   //   }
// // //   // }

// // //   Future<void> getData() async {
// // //     List<String>? comingList = preferences.getStringList("data");
// // //     if (comingList != null) {
// // //       alarmList =
// // //           comingList.map((e) => AlarmModel.fromJson(json.decode(e))).toList();

// // //       // Use addPostFrameCallback to notify listeners after the current frame
// // //       WidgetsBinding.instance.addPostFrameCallback((_) {
// // //         notifyListeners();
// // //       });
// // //     }
// // //   }

// // //   Future<void> setData() async {
// // //     List<String> listOfString =
// // //         alarmList.map((e) => json.encode(e.toJson())).toList();
// // //     await preferences.setStringList("data", listOfString);
// // //   }

// // //   // Initialize for notification
// // //   Future<void> initialize(BuildContext con) async {
// // //     context = con;
// // //     var androidInitialize =
// // //         AndroidInitializationSettings('@mipmap/ic_launcher');
// // //     var iOSInitialize = DarwinInitializationSettings();
// // //     var initializationSettings =
// // //         InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
// // //     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
// // //     await flutterLocalNotificationsPlugin!.initialize(initializationSettings,
// // //         onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
// // //   }

// // //   void onDidReceiveNotificationResponse(
// // //       NotificationResponse notificationResponse) async {
// // //     final String? payload = notificationResponse.payload;
// // //     if (payload != null) {
// // //       debugPrint('Notification payload: $payload');
// // //     }
// // //     await Navigator.push(
// // //         context, MaterialPageRoute<void>(builder: (context) => AlarmApp()));
// // //   }

// // //   Future<void> showNotification() async {
// // //     const androidNotificationDetails = AndroidNotificationDetails(
// // //       'your_channel_id',
// // //       'your_channel_name',
// // //       channelDescription: 'your_channel_description',
// // //       importance: Importance.max,
// // //       priority: Priority.high,
// // //       ticker: 'ticker',
// // //     );

// // //     const notificationDetails =
// // //         NotificationDetails(android: androidNotificationDetails);
// // //     await flutterLocalNotificationsPlugin!.show(
// // //       0,
// // //       'Plain Title',
// // //       'Plain Body',
// // //       notificationDetails,
// // //       payload: 'item_x',
// // //     );
// // //   }

// // //   Future<void> scheduleNotification(DateTime dateTime, int randomNumber) async {
// // //     int newTime =
// // //         dateTime.millisecondsSinceEpoch - DateTime.now().millisecondsSinceEpoch;

// // //     await flutterLocalNotificationsPlugin!.zonedSchedule(
// // //       randomNumber,
// // //       'Alarm Clock',
// // //       "${DateFormat().format(DateTime.now())}",
// // //       tz.TZDateTime.now(tz.local).add(Duration(milliseconds: newTime)),
// // //       const NotificationDetails(
// // //         android: AndroidNotificationDetails(
// // //           'your_channel_id',
// // //           'your_channel_name',
// // //           channelDescription: 'your_channel_description',
// // //           sound: RawResourceAndroidNotificationSound("alarm"),
// // //           autoCancel: false,
// // //           playSound: true,
// // //           priority: Priority.max,
// // //         ),
// // //       ),
// // //       androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
// // //       uiLocalNotificationDateInterpretation:
// // //           UILocalNotificationDateInterpretation.absoluteTime,
// // //     );
// // //   }

// // //   Future<void> cancelNotification(int notificationId) async {
// // //     await flutterLocalNotificationsPlugin!.cancel(notificationId);
// // //   }
// // // }

// // import 'dart:convert';
// // import 'package:alarm_app/main.dart';
// // import 'package:alarm_app/models/alarm_model.dart';
// // import 'package:alarm_app/notification_helper.dart';
// // import 'package:flutter/material.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// // import 'package:timezone/timezone.dart' as tz;
// // import 'package:intl/intl.dart';

// // class AlarmProvider extends ChangeNotifier {
// //    SharedPreferences? preferences;
// //   List<AlarmModel> alarmList = [];
// //   FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
// //   late BuildContext context;

// //   AlarmProvider() {
// //     _initializeSharedPreferences();
// //   }

// //   Future<void> _initializeSharedPreferences() async {
// //     preferences = await SharedPreferences.getInstance();
// //     await getData();
// //   }

// //   Future<void> setAlarm(
// //     String label,
// //     String dateTime,
// //     String alarmDate,
// //     bool check,
// //     String repeat,
// //     int id,
// //     int milliseconds,
// //   ) async {
// //     alarmList.add(AlarmModel(
// //       label: label,
// //       dateTime: dateTime,
// //       check: check,
// //       when: repeat,
// //       id: id,
// //       alarmDate: alarmDate,
// //       milliseconds: milliseconds,
// //     ));

// //     // استخدم scheduleNotification هنا لتحديد الإشعار
// //     // await NotificationHelper.scheduleNotification(label, alarmDate);

// //     await setData();
// //     notifyListeners();
// //   }

// //   Future<void> editSwitch(int index, bool check) async {
// //     alarmList[index].check = check;
// //     await setData(); // update sharedpreferences
// //     notifyListeners(); // listener to update ui
// //   }

// //   Future<void> removeAlarm(int index) async {
// //     if (index >= 0 && index < alarmList.length) {
// //       alarmList.removeAt(index); // Remove the alarm from the list
// //       await setData(); // Update SharedPreferences
// //       notifyListeners(); // Notify listeners to update the UI
// //     }
// //   }

// //   Future<void> getData() async {
// //     List<String>? comingList = preferences.getStringList("data");
// //     if (comingList != null) {
// //       alarmList =
// //           comingList.map((e) => AlarmModel.fromJson(json.decode(e))).toList();

// //       // Use addPostFrameCallback to notify listeners after the current frame
// //       WidgetsBinding.instance.addPostFrameCallback((_) {
// //         notifyListeners();
// //       });
// //     }
// //   }

// //   Future<void> setData() async {
// //     List<String> listOfString =
// //         alarmList.map((e) => json.encode(e.toJson())).toList();
// //     await preferences.setStringList("data", listOfString);
// //   }

// //   // Initialize for notification
// //   Future<void> initialize(BuildContext con) async {
// //     context = con;
// //     var androidInitialize =
// //         AndroidInitializationSettings('@mipmap/ic_launcher');
// //     var iOSInitialize = DarwinInitializationSettings();
// //     var initializationSettings =
// //         InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
// //     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
// //     await flutterLocalNotificationsPlugin!.initialize(initializationSettings,
// //         onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
// //   }

// //   void onDidReceiveNotificationResponse(
// //       NotificationResponse notificationResponse) async {
// //     final String? payload = notificationResponse.payload;
// //     if (payload != null) {
// //       debugPrint('Notification payload: $payload');
// //     }
// //     await Navigator.push(
// //         context, MaterialPageRoute<void>(builder: (context) => AlarmApp()));
// //   }

// //   Future<void> showNotification() async {
// //     const androidNotificationDetails = AndroidNotificationDetails(
// //       'your_channel_id',
// //       'your_channel_name',
// //       channelDescription: 'your_channel_description',
// //       importance: Importance.max,
// //       priority: Priority.high,
// //       ticker: 'ticker',
// //     );

// //     const notificationDetails =
// //         NotificationDetails(android: androidNotificationDetails);
// //     await flutterLocalNotificationsPlugin!.show(
// //       0,
// //       'Plain Title',
// //       'Plain Body',
// //       notificationDetails,
// //       payload: 'item_x',
// //     );
// //   }

// //   Future<void> scheduleNotification(DateTime dateTime, int randomNumber) async {
// //     int newTime =
// //         dateTime.millisecondsSinceEpoch - DateTime.now().millisecondsSinceEpoch;

// //     await flutterLocalNotificationsPlugin!.zonedSchedule(
// //       randomNumber,
// //       'Alarm Clock',
// //       "${DateFormat().format(DateTime.now())}",
// //       tz.TZDateTime.now(tz.local).add(Duration(milliseconds: newTime)),
// //       const NotificationDetails(
// //         android: AndroidNotificationDetails(
// //           'your_channel_id',
// //           'your_channel_name',
// //           channelDescription: 'your_channel_description',
// //           sound: RawResourceAndroidNotificationSound("alarm"),
// //           autoCancel: false,
// //           playSound: true,
// //           priority: Priority.max,
// //         ),
// //       ),
// //       androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
// //       uiLocalNotificationDateInterpretation:
// //           UILocalNotificationDateInterpretation.absoluteTime,
// //     );
// //   }

// //   Future<void> cancelNotification(int notificationId) async {
// //     await flutterLocalNotificationsPlugin!.cancel(notificationId);
// //   }
// // }

// import 'dart:convert';
// import 'package:alarm_app/main.dart';
// import 'package:alarm_app/models/alarm_model.dart';
// import 'package:alarm_app/notification_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:intl/intl.dart';

// class AlarmProvider extends ChangeNotifier {
//   SharedPreferences? preferences; // Make preferences nullable
//   List<AlarmModel> alarmList = [];
//   FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
//   late BuildContext context;

//   AlarmProvider() {
//     _initializeSharedPreferences();
//   }

//   Future<void> _initializeSharedPreferences() async {
//     preferences = await SharedPreferences.getInstance();
//     await getData();
//   }

//   Future<void> setAlarm(
//     String label,
//     String dateTime,
//     String alarmDate,
//     bool check,
//     String repeat,
//     int id,
//     int milliseconds,
//   ) async {
//     if (preferences == null) {
//       // Re-initialize if preferences is null
//       preferences = await SharedPreferences.getInstance();
//     }

//     alarmList.add(AlarmModel(
//       label: label,
//       dateTime: dateTime,
//       check: check,
//       when: repeat,
//       id: id,
//       alarmDate: alarmDate,
//       milliseconds: milliseconds,
//     ));

//     await setData();
//     notifyListeners();
//   }

//   Future<void> editSwitch(int index, bool check) async {
//     alarmList[index].check = check;
//     await setData(); // update shared preferences
//     notifyListeners(); // notify listeners to update UI
//   }

//   Future<void> removeAlarm(int index) async {
//     if (index >= 0 && index < alarmList.length) {
//       alarmList.removeAt(index); // Remove the alarm from the list
//       await setData(); // Update SharedPreferences
//       notifyListeners(); // Notify listeners to update the UI
//     }
//   }

//   Future<void> getData() async {
//     if (preferences == null) {
//       preferences = await SharedPreferences.getInstance();
//     }

//     List<String>? comingList = preferences?.getStringList("data");
//     if (comingList != null) {
//       alarmList =
//           comingList.map((e) => AlarmModel.fromJson(json.decode(e))).toList();

//       // Use addPostFrameCallback to notify listeners after the current frame
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         notifyListeners();
//       });
//     }
//   }

//   Future<void> setData() async {
//     List<String> listOfString =
//         alarmList.map((e) => json.encode(e.toJson())).toList();
//     await preferences?.setStringList("data", listOfString);
//   }

//   Future<void> initialize(BuildContext con) async {
//     context = con;
//     var androidInitialize =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//     var iOSInitialize = DarwinInitializationSettings();
//     var initializationSettings =
//         InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//     await flutterLocalNotificationsPlugin!.initialize(initializationSettings,
//         onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
//   }

//   void onDidReceiveNotificationResponse(
//       NotificationResponse notificationResponse) async {
//     final String? payload = notificationResponse.payload;
//     if (payload != null) {
//       debugPrint('Notification payload: $payload');
//     }
//     await Navigator.push(
//         context, MaterialPageRoute<void>(builder: (context) => AlarmApp()));
//   }

//   Future<void> showNotification() async {
//     const androidNotificationDetails = AndroidNotificationDetails(
//       'your_channel_id',
//       'your_channel_name',
//       channelDescription: 'your_channel_description',
//       importance: Importance.max,
//       priority: Priority.high,
//       ticker: 'ticker',
//     );

//     const notificationDetails =
//         NotificationDetails(android: androidNotificationDetails);
//     await flutterLocalNotificationsPlugin!.show(
//       0,
//       'Plain Title',
//       'Plain Body',
//       notificationDetails,
//       payload: 'item_x',
//     );
//   }

//   Future<void> scheduleNotification(DateTime dateTime, int randomNumber) async {
//     int newTime =
//         dateTime.millisecondsSinceEpoch - DateTime.now().millisecondsSinceEpoch;

//     await flutterLocalNotificationsPlugin!.zonedSchedule(
//       randomNumber,
//       'Alarm Clock',
//       "${DateFormat().format(DateTime.now())}",
//       tz.TZDateTime.now(tz.local).add(Duration(milliseconds: newTime)),
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           'your_channel_id',
//           'your_channel_name',
//           channelDescription: 'your_channel_description',
//           sound: RawResourceAndroidNotificationSound("alarm"),
//           autoCancel: false,
//           playSound: true,
//           priority: Priority.max,
//         ),
//       ),
//       androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//     );
//   }

//   Future<void> cancelNotification(int notificationId) async {
//     await flutterLocalNotificationsPlugin!.cancel(notificationId);
//   }
// }

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Alarm {
  final String? label;
  late String dateTime;
  bool isActive;

  Alarm({this.label, required this.dateTime, this.isActive = true});

  Map<String, dynamic> toJson() => {
        'label': label,
        'dateTime': dateTime,
      };

  static Alarm fromJson(Map<String, dynamic> json) {
    return Alarm(
      label: json['label'],
      dateTime: json['dateTime'],
    );
  }
}

class AlarmProvider with ChangeNotifier {
  List<Alarm> _alarmList = [];

  List<Alarm> get alarmList => _alarmList;

  AlarmProvider() {
    _loadAlarms();
  }

  Future<void> _loadAlarms() async {
    final prefs = await SharedPreferences.getInstance();
    final String? alarmsJson = prefs.getString('alarms');
    if (alarmsJson != null) {
      final List<dynamic> alarmsList = json.decode(alarmsJson);
      _alarmList = alarmsList.map((json) => Alarm.fromJson(json)).toList();
      notifyListeners();
    }
  }

  Future<void> addAlarm(String label, DateTime dateTime) async {
    _alarmList.add(Alarm(label: label, dateTime: dateTime.toIso8601String()));
    notifyListeners();
    await saveAlarms();
  }

  Future<void> saveAlarms() async {
    final prefs = await SharedPreferences.getInstance();
    final String alarmsJson =
        json.encode(_alarmList.map((alarm) => alarm.toJson()).toList());
    await prefs.setString('alarms', alarmsJson);
  }

  Future<void> removAlarm(int index) async {
    await alarmList.removeAt(index);
    notifyListeners();
    await saveAlarms();
  }
}
