import 'dart:async';
import 'package:alarm_app/add_alarm.dart';
import 'package:alarm_app/utils/alarm_provider.dart';
import 'package:alarm_app/widgets/show_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlarmPage extends StatefulWidget {
  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  void initState() {
    super.initState();
    context.read<AlarmProvider>().getData();

    // Update every second (optional)
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Alarm',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          Consumer<AlarmProvider>(
            builder: (context, alarm, child) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: ListView.builder(
                  itemCount: alarm.alarmList.length,
                  itemBuilder: (BuildContext context, index) {
                    return Dismissible(
                      key: Key(alarm.alarmList[index].id.toString()),
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      confirmDismiss: (direction) async {
                        // Show confirmation dialog before deleting
                        return await showDialog<bool>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text(
                                'Confirm Deletion',
                                style: TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              content: const Text(
                                'Are you sure you want to delete this alarm?',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              actions: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                      ),
                                      child: const Text(
                                        'Cancel',
                                        style: TextStyle(
                                          fontSize: 23,
                                          color: Colors.white,
                                        ),
                                      ),
                                      onPressed: () =>
                                          Navigator.of(context).pop(false),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                      ),
                                      child: const Text(
                                        'Delete',
                                        style: TextStyle(
                                          fontSize: 23,
                                          color: Colors.white,
                                        ),
                                      ),
                                      onPressed: () =>
                                          Navigator.of(context).pop(true),
                                    ),
                                  ],
                                )
                              ],
                            );
                          },
                        );
                      },
                      onDismissed: (direction) {
                        // Remove the alarm from the list
                        alarm.removeAlarm(index);
                        customShowSnackBar(
                            content: 'Alarm Deleted', context: context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 8.0),
                        child: Card(
                          color: Colors.black.withOpacity(0.01),
                          // Optional: Use Card for elevation
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16.0),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      alarm.alarmList[index].alarmDate!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      alarm.alarmList[index].dateTime!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                // CupertinoSwitch(
                                //   value: (alarm.alarmList[index].milliseconds! <
                                //           DateTime.now().microsecondsSinceEpoch)
                                //       ? false
                                //       : alarm.alarmList[index].check,
                                //   onChanged: (v) {
                                //     alarm.editSwitch(index, v);
                                //     alarm.cancelNotification(
                                //         alarm.alarmList[index].id!);
                                //   },
                                // ),

                                CupertinoSwitch(
                                  value: (alarm.alarmList[index].milliseconds! <
                                          DateTime.now().millisecondsSinceEpoch)
                                      ? false
                                      : alarm.alarmList[index].check,
                                  onChanged: (v) {
                                    alarm.editSwitch(index, v);
                                    // يمكنك إلغاء الإشعار هنا إذا كان المستخدم يغير المفتاح إلى إيقاف
                                    if (!v) {
                                      alarm.cancelNotification(
                                          alarm.alarmList[index].id!);
                                    }
                                  },
                                ),
                              ],
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  alarm.alarmList[index].when!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    ' | ${alarm.alarmList[index].label!}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddAlarm(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}
