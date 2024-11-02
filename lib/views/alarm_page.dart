import 'package:alarm_app/add_alarm.dart';
import 'package:alarm_app/utils/alarm_provider.dart';
import 'package:alarm_app/widgets/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter/cupertino.dart';

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const androidInitSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const initializationSettings =
        InitializationSettings(android: androidInitSettings);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> _scheduleNotification(
      DateTime alarmTime, String title, String body) async {
    final tzDateTime = tz.TZDateTime.from(alarmTime, tz.local);

    if (tzDateTime.isBefore(tz.TZDateTime.now(tz.local))) {
      return; // Exit if the time is not valid
    }

    const androidDetails = AndroidNotificationDetails(
      'alarm_channel',
      'Alarm Notifications',
      importance: Importance.high,
      priority: Priority.high,
      playSound: true,
    );
    const notificationDetails = NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      title,
      body,
      tzDateTime,
      notificationDetails,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> _updateAlarmTime(
      BuildContext context, AlarmProvider alarmProvider, int index) async {
    DateTime currentTime =
        DateTime.parse(alarmProvider.alarmList[index].dateTime);

    // Open a dialog to pick a new date and time
    DateTime? newDateTime = await showModalBottomSheet<DateTime>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        DateTime selectedDate = currentTime;
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Select Date and Time",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 300,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.dateAndTime,

                  minimumDate: DateTime.now(), // Set minimum date to now
                  onDateTimeChanged: (DateTime dateTime) {
                    selectedDate = dateTime;
                  },
                ),
              ),
              const SizedBox(height: 16),
              MaterialButton(
                color: Colors.black,
                onPressed: () {
                  Navigator.of(context).pop(selectedDate);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    if (newDateTime != null) {
      // Update the dateTime field in the alarm provider
      alarmProvider.alarmList[index].dateTime = newDateTime.toIso8601String();
      alarmProvider.notifyListeners(); // Notify listeners to update UI

      // Save the updated alarm time to SharedPreferences
      await alarmProvider.saveAlarms(); // Save changes to SharedPreferences

      // // Reschedule the notification
      // await _scheduleNotification(
      //     newDateTime,
      //     'Alarm: ${alarmProvider.alarmList[index].label}',
      //     'Your alarm is ringing!');

      // احسب الوقت المتبقي حتى وقت التنبيه
      Duration remainingTime = newDateTime.difference(DateTime.now());
      int hoursRemaining = remainingTime.inHours;
      int minutesRemaining = remainingTime.inMinutes;

      customShowSnackBar(
        context: context,
        content:
            'Alarm set for ${hoursRemaining}h ${minutesRemaining}m from now.',
        backgroundColor: Colors.blue,
      );
    }
  }

  Future<bool?> showDeletionDialog(BuildContext context, int index) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Confirm Deletion',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        content: const Text(
          'Are you sure you want to delete this alarm?',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                color: Colors.black,
                onPressed: () => Navigator.of(context).pop(false),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              MaterialButton(
                color: Colors.black,
                onPressed: () => Navigator.of(context).pop(true),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Ok',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );

    return shouldDelete; // Return the user's choice
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 25,
        ),
        centerTitle: true,
        title: const Text(
          'Alarm Clock',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Consumer<AlarmProvider>(
        builder: (context, alarmProvider, child) {
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: alarmProvider.alarmList.length,
            itemBuilder: (context, index) {
              final alarmData = alarmProvider.alarmList[index];
              final alarmTime = DateTime.parse(alarmData.dateTime);
              final currentTime = DateTime.now();
              // // Schedule the notification for the alarm
              // _scheduleNotification(alarmTime,
              //     'Aladfssdfsrm: ${alarmData.label}', 'Your alarm is ringing!');

              final hour = alarmTime.hour % 12 == 0 ? 12 : alarmTime.hour % 12;
              final amPm = alarmTime.hour >= 12 ? 'PM' : 'AM';
              final dateFormat =
                  '${alarmTime.day}/${alarmTime.month}/${alarmTime.year}';
              final timeFormat =
                  '${hour.toString().padLeft(2, '0')}:${alarmTime.minute.toString().padLeft(2, '0')}';

              double screenWidth = MediaQuery.of(context).size.width;

              bool isAlarmActive =
                  currentTime.isBefore(alarmTime) && alarmData.isActive;
              return Dismissible(
                key: Key(alarmData
                    .dateTime), // Unique key for the Dismissible widget,
                direction: DismissDirection.endToStart,
                confirmDismiss: (direction) async {
                  // Show deletion dialog
                  final shouldDelete = await showDeletionDialog(context, index);
                  if (shouldDelete == true) {
                    // Cancel the associated notification
                    flutterLocalNotificationsPlugin.cancel(index);
                    // Delete the alarm if confirmed
                    alarmProvider.removAlarm(index);

                    customShowSnackBar(
                      context: context,
                      content: 'Alarm Deleted',
                      backgroundColor: Colors.blue,
                    );
                  }
                  return shouldDelete; // Return the result of the dialog
                },
                onDismissed: (direction) async {
                  // Remove the alarm
                  alarmProvider.removAlarm(index);
                  customShowSnackBar(
                    context: context,
                    content: 'Alarm Deleted',
                    backgroundColor: Colors.blue,
                  );

                  // Cancel the associated notification
                  await flutterLocalNotificationsPlugin.cancel(index);
                },

                background: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 10,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                ),

                child: GestureDetector(
                  onTap: () => _updateAlarmTime(context, alarmProvider, index),
                  child: Card(
                    color: const Color(0xff1D1D1F),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16.0),
                      title: Container(
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Align children at the start
                          children: [
                            Expanded(
                              // Allow the text to use available space
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment
                                    .start, // Align text to the start
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: screenWidth * 0.2,
                                        color: const Color(0xff1D1D1F),
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            timeFormat,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow
                                                .ellipsis, // Change to ellipsis for better handling
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: screenWidth * 0.2,
                                            child: Text(
                                              amPm,
                                              style: const TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ), // Space between title and time
                                ],
                              ),
                            ),
                            const SizedBox(
                                width: 4), // Space between text and switch
                            Column(
                              mainAxisSize: MainAxisSize.min, // Minimize height
                              children: [
                                const SizedBox(height: 10),
                                CupertinoSwitch(
                                  activeColor: Colors.blue,
                                  value: alarmData
                                      .isActive, // Ensure you have the isActive property
                                  onChanged: (bool value) async {
                                    setState(() {
                                      alarmData.isActive =
                                          value; // Update alarm state
                                    });

                                    if (value) {
                                      // Schedule notification when active
                                      await _scheduleNotification(
                                        alarmTime,
                                        'Alarm: ${alarmData.label}',
                                        'Your alarm is ringing!',
                                      );

                                      Duration remainingTime =
                                          alarmTime.difference(DateTime.now());
                                      int hoursRemaining =
                                          remainingTime.inHours;
                                      int minutesRemaining =
                                          remainingTime.inMinutes;

                                      customShowSnackBar(
                                        context: context,
                                        content:
                                            'Alarm set for ${hoursRemaining}h ${minutesRemaining}m from now.',
                                        backgroundColor: Colors.blue,
                                      );
                                    } else {
                                      // Cancel notification when inactive
                                      await flutterLocalNotificationsPlugin.cancel(
                                          index); // Replace with the unique alarm ID

                                      customShowSnackBar(
                                        context: context,
                                        content: 'Notification cancelled',
                                        backgroundColor: Colors.blue,
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dateFormat,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            alarmData.label ?? '',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // فتح صفحة إضافة الإنذار
          final newAlarm = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddAlarm()),
          );

          if (newAlarm != null) {
            await _scheduleNotification(
              DateTime.parse(newAlarm.dateTime),
              'Alarm: ${newAlarm.label}',
              'Your alarm is ringing!',
            );

            setState(() {});
          }
        },
        child: Icon(
          Icons.add,
          size: 35,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
