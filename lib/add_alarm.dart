import 'package:alarm_app/utils/alarm_provider.dart';
import 'package:alarm_app/widgets/show_snack_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddAlarm extends StatefulWidget {
  @override
  _AddAlarmState createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {
  String? label;
  DateTime? selectedDateTime;
  bool isDailyRepeat = false;

  String selectedRingtone = 'Default';

  List<String> ringtones = [
    'Default',
    'Tone 1',
    'Tone 2',
    'Tone 3',
    'Tone 4',
  ];

  @override
  void initState() {
    super.initState();
    selectedDateTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(size: 25, color: Colors.white),
        centerTitle: true,
        title: const Text(
          'New Alarm',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: IconButton(
              onPressed: () {
                // عند إضافة إنذار جديد
                final alarm = Alarm(
                  label: label,
                  dateTime: selectedDateTime.toString(),
                  // أضف الخصائص الأخرى اللازمة هنا
                );

                if (label == null) {
                  customShowSnackBar(
                    context: context,
                    content: 'Label is required',
                    backgroundColor: Colors.red,
                  );
                }

                if (label != null && selectedDateTime != null) {
                  Provider.of<AlarmProvider>(context, listen: false)
                      .addAlarm(label!, selectedDateTime!);
                  Navigator.of(context).pop(alarm);

                  Duration remainingTime =
                      selectedDateTime!.difference(DateTime.now());
                  int hoursRemaining = remainingTime.inHours;
                  int minutesRemaining = remainingTime.inMinutes % 60;

                  customShowSnackBar(
                    context: context,
                    content:
                        'Alarm set for ${hoursRemaining}h ${minutesRemaining}m from now.',
                    backgroundColor: Colors.blue,
                  );
                }
              },
              icon: const Icon(
                Icons.check,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: screenHeight * 0.4,
                child: CupertinoTheme(
                  data: const CupertinoThemeData(
                    textTheme: CupertinoTextThemeData(
                      dateTimePickerTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20, // Set text color to white
                      ),
                    ),
                  ),
                  child: CupertinoDatePicker(
                    minimumDate: DateTime.now(),
                    mode: CupertinoDatePickerMode.dateAndTime,
                    showDayOfWeek: true,
                    dateOrder: DatePickerDateOrder.dmy,
                    onDateTimeChanged: (DateTime newDateTime) {
                      setState(() {
                        selectedDateTime = newDateTime;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
                onChanged: (value) {
                  label = value;
                },
              ),

              const SizedBox(height: 20),
              // Widget لاختيار النغمة
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: screenWidth * 0.4,
                      //color: Colors.red,
                      child: const Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        'Select Ringtone:',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DropdownButton<String>(
                      value: selectedRingtone,
                      dropdownColor: Colors.black,
                      iconEnabledColor: Colors.white,
                      items: ringtones.map((String ringtone) {
                        return DropdownMenuItem<String>(
                          value: ringtone,
                          child: Text(
                            ringtone,
                            style: const TextStyle(color: Colors.white),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newRingtone) {
                        setState(() {
                          selectedRingtone = newRingtone!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
