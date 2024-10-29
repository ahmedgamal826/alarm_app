// // // import 'package:flutter/material.dart';

// // // class TimerPage extends StatefulWidget {
// // //   const TimerPage({super.key});

// // //   @override
// // //   State<TimerPage> createState() => _TimerPageState();
// // // }

// // // class _TimerPageState extends State<TimerPage> {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: Colors.white,
// // //     );
// // //   }
// // // }

// // import 'dart:async';
// // import 'package:flutter/material.dart';

// // class TimerScreen extends StatefulWidget {
// //   @override
// //   _TimerScreenState createState() => _TimerScreenState();
// // }

// // class _TimerScreenState extends State<TimerScreen> {
// //   late Timer _timer;
// //   int _start = 60; // زمن البدء بالثواني
// //   bool _isRunning = false;

// //   @override
// //   void initState() {
// //     super.initState();
// //   }

// //   @override
// //   void dispose() {
// //     _timer.cancel();
// //     super.dispose();
// //   }

// //   void startTimer() {
// //     if (_isRunning) return; // تجنب بدء المؤقت مرة أخرى إذا كان قيد التشغيل
// //     _isRunning = true;

// //     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
// //       if (_start > 0) {
// //         setState(() {
// //           _start--;
// //         });
// //       } else {
// //         _timer.cancel();
// //         setState(() {
// //           _isRunning = false;
// //         });
// //         // يمكنك إضافة الكود هنا لإظهار إشعار عندما ينتهي المؤقت
// //       }
// //     });
// //   }

// //   void stopTimer() {
// //     _timer.cancel();
// //     setState(() {
// //       _isRunning = false;
// //     });
// //   }

// //   void resetTimer() {
// //     stopTimer();
// //     setState(() {
// //       _start = 60; // إعادة تعيين الزمن إلى 60 ثانية
// //     });
// //   }

// //   String formatTime(int seconds) {
// //     String twoDigits(int n) => n.toString().padLeft(2, '0');
// //     final hours = twoDigits(seconds ~/ 3600);
// //     final minutes = twoDigits((seconds % 3600) ~/ 60);
// //     final secs = twoDigits(seconds % 60);
// //     return "$hours:$minutes:$secs";
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Timer'),
// //         centerTitle: true,
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Text(
// //               formatTime(_start),
// //               style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
// //             ),
// //             SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: startTimer,
// //               child: Text('Start Timer'),
// //             ),
// //             SizedBox(height: 10),
// //             ElevatedButton(
// //               onPressed: stopTimer,
// //               child: Text('Stop Timer'),
// //             ),
// //             SizedBox(height: 10),
// //             ElevatedButton(
// //               onPressed: resetTimer,
// //               child: Text('Reset Timer'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'dart:async';
// import 'package:flutter/material.dart';

// class TimerScreen extends StatefulWidget {
//   @override
//   _TimerScreenState createState() => _TimerScreenState();
// }

// class _TimerScreenState extends State<TimerScreen> {
//   late Timer _timer;
//   int _start = 0; // الزمن المتبقي بالثواني
//   bool _isRunning = false;

//   // Controllers for input fields
//   final TextEditingController _hoursController = TextEditingController();
//   final TextEditingController _minutesController = TextEditingController();
//   final TextEditingController _secondsController = TextEditingController();

//   @override
//   void dispose() {
//     _timer.cancel();
//     _hoursController.dispose();
//     _minutesController.dispose();
//     _secondsController.dispose();
//     super.dispose();
//   }

//   void startTimer() {
//     if (_isRunning) return; // تجنب بدء المؤقت مرة أخرى إذا كان قيد التشغيل
//     _isRunning = true;

//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       if (_start > 0) {
//         setState(() {
//           _start--;
//         });
//       } else {
//         _timer.cancel();
//         _isRunning = false;
//         // يمكن إضافة رسالة تنبيه هنا عند انتهاء الوقت
//       }
//     });
//   }

//   void stopTimer() {
//     _timer.cancel();
//     _isRunning = false;
//   }

//   void resetTimer() {
//     stopTimer();
//     setState(() {
//       _start = 0; // إعادة تعيين الزمن
//     });
//   }

//   void setTimer() {
//     int hours = int.tryParse(_hoursController.text) ?? 0;
//     int minutes = int.tryParse(_minutesController.text) ?? 0;
//     int seconds = int.tryParse(_secondsController.text) ?? 0;

//     // حساب الوقت الإجمالي بالثواني
//     setState(() {
//       _start = (hours * 3600) + (minutes * 60) + seconds;
//     });
//   }

//   String formatTime(int seconds) {
//     int hours = (seconds ~/ 3600);
//     int minutes = (seconds ~/ 60) % 60;
//     int remainingSeconds = seconds % 60;
//     return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}";
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Custom Timer'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               formatTime(_start),
//               style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // إدخال الساعات
//                 SizedBox(
//                   width: 60,
//                   child: TextField(
//                     controller: _hoursController,
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(labelText: 'Hours'),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 // إدخال الدقائق
//                 SizedBox(
//                   width: 60,
//                   child: TextField(
//                     controller: _minutesController,
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(labelText: 'Minutes'),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 // إدخال الثواني
//                 SizedBox(
//                   width: 60,
//                   child: TextField(
//                     controller: _secondsController,
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(labelText: 'Seconds'),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: setTimer,
//               child: Text('Set Timer'),
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: startTimer,
//                   child: Text('Start'),
//                 ),
//                 SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: stopTimer,
//                   child: Text('Stop'),
//                 ),
//                 SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: resetTimer,
//                   child: Text('Reset'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:alarm_app/notification_helper.dart';
import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late Timer _timer;
  int _start = 0; // الزمن المتبقي بالثواني
  bool _isRunning = false;

  // Controllers for input fields
  final TextEditingController _hoursController = TextEditingController();
  final TextEditingController _minutesController = TextEditingController();
  final TextEditingController _secondsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    NotificationHelper.init(); // تهيئة إشعارات
  }

  @override
  void dispose() {
    _timer.cancel();
    _hoursController.dispose();
    _minutesController.dispose();
    _secondsController.dispose();
    super.dispose();
  }

  void startTimer() {
    if (_isRunning) return; // تجنب بدء المؤقت مرة أخرى إذا كان قيد التشغيل
    _isRunning = true;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start > 0) {
        setState(() {
          _start--;
        });
      } else {
        _timer.cancel();
        _isRunning = false;
        // إرسال إشعار عند انتهاء الوقت
        NotificationHelper.schudleNotification(
          'Timer has ended!',
          'Time is up!',
        );
      }
    });
  }

  void stopTimer() {
    _timer.cancel();
    _isRunning = false;
  }

  void resetTimer() {
    stopTimer();
    setState(() {
      _start = 0; // إعادة تعيين الزمن
    });
  }

  void setTimer() {
    int hours = int.tryParse(_hoursController.text) ?? 0;
    int minutes = int.tryParse(_minutesController.text) ?? 0;
    int seconds = int.tryParse(_secondsController.text) ?? 0;

    // حساب الوقت الإجمالي بالثواني
    setState(() {
      _start = (hours * 3600) + (minutes * 60) + seconds;
    });
  }

  String formatTime(int seconds) {
    int hours = (seconds ~/ 3600);
    int minutes = (seconds ~/ 60) % 60;
    int remainingSeconds = seconds % 60;
    return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Timer',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formatTime(_start),
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // إدخال الساعات
                SizedBox(
                  width: 60,
                  child: TextField(
                    controller: _hoursController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Hours'),
                  ),
                ),
                SizedBox(width: 10),
                // إدخال الدقائق
                SizedBox(
                  width: 60,
                  child: TextField(
                    controller: _minutesController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Minutes'),
                  ),
                ),
                SizedBox(width: 10),
                // إدخال الثواني
                SizedBox(
                  width: 60,
                  child: TextField(
                    controller: _secondsController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Seconds'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: setTimer,
              child: Text(
                'Set Timer',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: startTimer,
                  child: Text(
                    'Start',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: stopTimer,
                  child: Text(
                    'Stop',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: resetTimer,
                  child: Text(
                    'Reset',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
