// // import 'dart:math';

// // import 'package:alarm_app/utils/alarm_provider.dart';
// // import 'package:alarm_app/widgets/show_snack_bar.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'package:intl/intl.dart';

// // class AddAlarm extends StatefulWidget {
// //   const AddAlarm({super.key});

// //   @override
// //   State<AddAlarm> createState() => _AddAlaramState();
// // }

// // class _AddAlaramState extends State<AddAlarm> {
// //   late TextEditingController controller;

// //   String? alarmDate;
// //   String? dateTime;
// //   bool repeat = false;

// //   DateTime? notificationtime;

// //   String? name = "none";
// //   int? Milliseconds;

// //   @override
// //   void initState() {
// //     controller = TextEditingController();
// //     context.read<AlarmProvider>().getData();
// //     super.initState();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         iconTheme: const IconThemeData(size: 25),
// //         backgroundColor: Colors.white,
// //         actions: [
// //           Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: IconButton(
// //               onPressed: () {
// //                 Random random = new Random();
// //                 int randomNumber = random.nextInt(100);

// //                 context.read<AlarmProvider>().setAlarm(
// //                     controller.text,
// //                     alarmDate!,
// //                     dateTime!,
// //                     true,
// //                     name!,
// //                     randomNumber,
// //                     Milliseconds!);
// //                 context.read<AlarmProvider>().setData();

// //                 context
// //                     .read<AlarmProvider>()
// //                     .scheduleNotification(notificationtime!, randomNumber);

// //                 Navigator.pop(context);

// //                 customShowSnackBar(
// //                   content: 'Alarm Added',
// //                   context: context,
// //                 );
// //               },
// //               icon: const Icon(
// //                 Icons.check,
// //                 size: 30,
// //               ),
// //             ),
// //           )
// //         ],
// //         automaticallyImplyLeading: true,
// //         title: const Text(
// //           'Add Alarm',
// //           style: TextStyle(
// //             fontWeight: FontWeight.bold,
// //             fontSize: 25,
// //           ),
// //         ),
// //         centerTitle: true,
// //       ),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           children: [
// //             Container(
// //               height: MediaQuery.of(context).size.height * 0.5,
// //               width: MediaQuery.of(context).size.width,
// //               child: Center(
// //                   child: CupertinoDatePicker(
// //                 showDayOfWeek: true,
// //                 minimumDate: DateTime.now(),
// //                 dateOrder: DatePickerDateOrder.dmy,
// //                 onDateTimeChanged: (va) {
// //                   alarmDate = DateFormat().add_jms().format(va);
// //                   dateTime =
// //                       DateFormat('yyyy-MM-dd').format(va); // Format the date
// //                   Milliseconds = va.microsecondsSinceEpoch;

// //                   notificationtime = va;

// //                   print(dateTime);
// //                 },
// //               )),
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.all(8.0),
// //               child: Container(
// //                 height: MediaQuery.of(context).size.width * 0.13,
// //                 width: MediaQuery.of(context).size.width,
// //                 child: Padding(
// //                   padding: const EdgeInsets.symmetric(horizontal: 10),
// //                   child: CupertinoTextField(
// //                     decoration: BoxDecoration(
// //                       color: Colors.grey.shade400,
// //                     ),
// //                     placeholder: "Add Label",
// //                     controller: controller,
// //                     cursorColor: Colors.white,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(height: 20),
// //             Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 10),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   const Padding(
// //                     padding: EdgeInsets.all(8.0),
// //                     child: Text(
// //                       " Repeat daily",
// //                       style: TextStyle(
// //                         fontSize: 22,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                   ),
// //                   CupertinoSwitch(
// //                     value: repeat,
// //                     onChanged: (bool value) {
// //                       repeat = value;

// //                       if (repeat == false) {
// //                         name = "none";
// //                       } else {
// //                         name = "Everyday";
// //                       }

// //                       setState(() {});
// //                     },
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             const SizedBox(height: 40),
// //             MaterialButton(
// //               color: Colors.black,
// //               onPressed: () {
// //                 Random random = new Random();
// //                 int randomNumber = random.nextInt(100);

// //                 context.read<AlarmProvider>().setAlarm(
// //                     controller.text,
// //                     alarmDate ?? '',
// //                     dateTime ?? '',
// //                     true,
// //                     name!,
// //                     randomNumber,
// //                     Milliseconds!);
// //                 context.read<AlarmProvider>().setData();

// //                 context
// //                     .read<AlarmProvider>()
// //                     .scheduleNotification(notificationtime!, randomNumber);

// //                 Navigator.pop(context);
// //                 customShowSnackBar(
// //                   content: 'Alarm Added',
// //                   context: context,
// //                 );
// //               },
// //               child: const Padding(
// //                 padding: EdgeInsets.all(8.0),
// //                 child: Text(
// //                   "Set Alarm",
// //                   style: TextStyle(
// //                     fontSize: 22,
// //                     fontWeight: FontWeight.bold,
// //                     color: Colors.white,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(height: 20)
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'dart:math';

// import 'package:alarm_app/utils/alarm_provider.dart';
// import 'package:alarm_app/widgets/show_snack_bar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:intl/intl.dart';

// class AddAlarm extends StatefulWidget {
//   const AddAlarm({super.key});

//   @override
//   State<AddAlarm> createState() => _AddAlarmState();
// }

// class _AddAlarmState extends State<AddAlarm> {
//   late TextEditingController controller;
//   String? alarmDate;
//   String? dateTime;
//   bool repeat = false;
//   DateTime? notificationTime;
//   String? name = "none";
//   int? milliseconds;

//   @override
//   void initState() {
//     super.initState();
//     controller = TextEditingController();
//     context.read<AlarmProvider>().getData();
//   }

//   void setAlarm() {
//     Random random = Random();
//     int randomNumber = random.nextInt(100);

//     context.read<AlarmProvider>().setAlarm(
//       controller.text,
//       alarmDate ?? '',
//       dateTime ?? '',
//       true,
//       name!,
//       randomNumber,
//       milliseconds!,
//     );

//     context.read<AlarmProvider>().setData();
//     context.read<AlarmProvider>().scheduleNotification(notificationTime!, randomNumber);

//     Navigator.pop(context);
//     customShowSnackBar(content: 'Alarm Added', context: context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         iconTheme: const IconThemeData(size: 25),
//         backgroundColor: Colors.white,
//         title: const Text(
//           'Add Alarm',
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             onPressed: setAlarm,
//             icon: const Icon(Icons.check, size: 30),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height * 0.5,
//               width: MediaQuery.of(context).size.width,
//               child: Center(
//                 child: CupertinoDatePicker(
//                   showDayOfWeek: true,
//                   minimumDate: DateTime.now(),
//                   dateOrder: DatePickerDateOrder.dmy,
//                   onDateTimeChanged: (va) {
//                     alarmDate = DateFormat().add_jms().format(va);
//                     dateTime = DateFormat('yyyy-MM-dd').format(va);
//                     milliseconds = va.millisecondsSinceEpoch; // Use milliseconds since epoch

//                     notificationTime = va; // Save the notification time
//                   },
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 height: MediaQuery.of(context).size.width * 0.13,
//                 width: MediaQuery.of(context).size.width,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: CupertinoTextField(
//                     decoration: BoxDecoration(
//                       color: Colors.grey.shade400,
//                     ),
//                     placeholder: "Add Label",
//                     controller: controller,
//                     cursorColor: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text(
//                       " Repeat daily",
//                       style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   CupertinoSwitch(
//                     value: repeat,
//                     onChanged: (bool value) {
//                       setState(() {
//                         repeat = value;
//                         name = repeat ? "Everyday" : "none";
//                       });
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 40),
//             MaterialButton(
//               color: Colors.black,
//               onPressed: setAlarm,
//               child: const Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Text(
//                   "Set Alarm",
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:math';
import 'package:alarm_app/utils/alarm_provider.dart';
import 'package:alarm_app/widgets/show_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class AddAlarm extends StatefulWidget {
  const AddAlarm({super.key});

  @override
  State<AddAlarm> createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {
  late TextEditingController controller;
  String? alarmDate;
  String? dateTime;
  bool repeat = false;
  DateTime? notificationTime;
  String? name = "none";
  int? milliseconds;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(size: 25),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                if (alarmDate != null && dateTime != null) {
                  Random random = Random();
                  int randomNumber = random.nextInt(100);

                  context.read<AlarmProvider>().setAlarm(
                        controller.text,
                        dateTime!,
                        alarmDate!,
                        true,
                        repeat ? name! : "none",
                        randomNumber,
                        milliseconds!,
                      );

                  Navigator.pop(context);
                  customShowSnackBar(
                    content: 'Alarm Added',
                    context: context,
                  );
                } else {
                  customShowSnackBar(
                    content: 'Please select a date and time.',
                    context: context,
                  );
                }
              },
              icon: const Icon(Icons.check, size: 30),
            ),
          )
        ],
        title: const Text(
          'Add Alarm',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: CupertinoDatePicker(
                  showDayOfWeek: true,
                  minimumDate: DateTime.now(),
                  dateOrder: DatePickerDateOrder.dmy,
                  onDateTimeChanged: (va) {
                    alarmDate = DateFormat().add_jms().format(va);
                    dateTime = DateFormat('yyyy-MM-dd').format(va);
                    milliseconds = va.millisecondsSinceEpoch;
                    notificationTime = va;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.width * 0.13,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CupertinoTextField(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                    ),
                    placeholder: "Add Label",
                    controller: controller,
                    cursorColor: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      " Repeat daily",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  CupertinoSwitch(
                    value: repeat,
                    onChanged: (bool value) {
                      setState(() {
                        repeat = value;
                        name = repeat ? "Everyday" : "none";
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            MaterialButton(
              color: Colors.black,
              onPressed: () {
                if (alarmDate != null && dateTime != null) {
                  Random random = Random();
                  int randomNumber = random.nextInt(100);

                  context.read<AlarmProvider>().setAlarm(
                        controller.text,
                        dateTime!,
                        alarmDate!,
                        true,
                        repeat ? name! : "none",
                        randomNumber,
                        milliseconds!,
                      );

                  Navigator.pop(context);
                  customShowSnackBar(
                    content: 'Alarm Added',
                    context: context,
                  );
                } else {
                  customShowSnackBar(
                    content: 'Please select a date and time.',
                    context: context,
                  );
                }
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Set Alarm",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
