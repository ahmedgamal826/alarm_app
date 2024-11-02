// import 'dart:async';

// import 'package:alarm_app/widgets/clock_view.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class ClockPage extends StatefulWidget {
//   const ClockPage({super.key});

//   @override
//   State<ClockPage> createState() => _ClockPageState();
// }

// class _ClockPageState extends State<ClockPage> {
//   Timer? _timer;
//   String _currentTime = '';

//   @override
//   void initState() {
//     super.initState();
//     _startTimer();
//   }

//   void _startTimer() {
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (mounted) {
//         setState(() {
//           _currentTime = DateTime.now()
//               .toLocal()
//               .toString()
//               .split(' ')[1]
//               .split('.')[0]; // Get time as HH:MM:SS
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel(); // Cancel the timer when disposing
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var dateTimeNow = DateTime.now();
//     var formattedTime = DateFormat('hh:mm a').format(dateTimeNow);
//     var formattedDate = DateFormat('EEE, d MMM').format(dateTimeNow);

//     double screenHeight = MediaQuery.of(context).size.height;
//     double screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: Container(
//               alignment: Alignment.center,
//               color: Colors.white,
//               child: Column(
//                 children: [
//                   SizedBox(height: screenHeight * 0.08),
//                   Text(
//                     'Clock',
//                     style: TextStyle(
//                       fontSize: screenWidth * 0.08,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: screenHeight * 0.05),
//                   Text(
//                     formattedTime,
//                     style: TextStyle(
//                       fontSize: screenWidth * 0.12,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     formattedDate,
//                     style: TextStyle(
//                       fontSize: screenWidth * 0.06,
//                     ),
//                   ),
//                   SizedBox(height: screenHeight * 0.04),
//                   ClockView(size: screenWidth * 0.8),
//                   SizedBox(height: screenHeight * 0.03),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:alarm_app/widgets/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClockPage extends StatefulWidget {
  ClockPage({super.key, required this.isDarkMode});

  late bool isDarkMode;

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  Timer? _timer;
  String _currentTime = '';

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _currentTime = DateTime.now()
              .toLocal()
              .toString()
              .split(' ')[1]
              .split('.')[0]; // Get time as HH:MM:SS
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when disposing
    super.dispose();
  }

  void _toggleDarkMode() {
    setState(() {
      widget.isDarkMode = !widget.isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    var dateTimeNow = DateTime.now();
    var formattedTime = DateFormat('hh:mm a').format(dateTimeNow);
    var formattedDate = DateFormat('EEE, d MMM').format(dateTimeNow);

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              color: widget.isDarkMode ? Colors.black : Colors.white,
              child: Column(
                children: [
                  Text(
                    'Clock',
                    style: TextStyle(
                      fontSize: screenWidth * 0.08,
                      fontWeight: FontWeight.bold,
                      color: widget.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Text(
                    formattedTime,
                    style: TextStyle(
                      fontSize: screenWidth * 0.12,
                      fontWeight: FontWeight.bold,
                      color: widget.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  Text(
                    formattedDate,
                    style: TextStyle(
                      fontSize: screenWidth * 0.06,
                      color:
                          widget.isDarkMode ? Colors.white54 : Colors.black54,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  ClockView(
                    size: screenWidth * 0.8,
                    isDarkMode: widget.isDarkMode,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
