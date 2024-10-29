import 'package:alarm_app/views/alarm_page.dart';
import 'package:alarm_app/views/clock_page.dart';
import 'package:alarm_app/views/stopwatch_page.dart';
import 'package:alarm_app/views/timer_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const ClockPage(),
    AlarmPage(),
    TimerScreen(),
    const StopWatchPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        items: const [
          Icon(Icons.watch_later_outlined, size: 30),
          Icon(Icons.alarm, size: 30),
          Icon(Icons.stop_circle_outlined, size: 30),
          Icon(Icons.timer_outlined, size: 30),
        ],
        color: Colors.grey,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        height: 60,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

// import 'package:alarm_app/views/alarm_page.dart';
// import 'package:alarm_app/views/clock_page.dart';
// import 'package:alarm_app/views/stopwatch_page.dart';
// import 'package:alarm_app/timer_page.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 0;

//   final List<Widget> _pages = [
//     const ClockPage(),
//     AlarmPage(), // This is your AlarmPage
//     const TimerPage(),
//     const StopWatchPage(),
//   ];

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   // Automatically navigate to AlarmPage on load
//   //   Future.delayed(Duration.zero, () {
//   //     Navigator.pushReplacement(
//   //       context,
//   //       MaterialPageRoute(builder: (context) => _pages[1]), // Open AlarmPage
//   //     );
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: CurvedNavigationBar(
//         items: const [
//           Icon(Icons.watch_later_outlined, size: 30),
//           Icon(Icons.alarm, size: 30),
//           Icon(Icons.stop_circle_outlined, size: 30),
//           Icon(Icons.timer_outlined, size: 30),
//         ],
//         color: Colors.grey,
//         buttonBackgroundColor: Colors.white,
//         backgroundColor: Colors.transparent,
//         height: 60,
//         animationCurve: Curves.easeInOut,
//         animationDuration: const Duration(milliseconds: 300),
//         onTap: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//       ),
//     );
//   }
// }
