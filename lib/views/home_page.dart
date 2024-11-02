// import 'package:alarm_app/views/alarm_page.dart';
// import 'package:alarm_app/views/clock_page.dart';
// import 'package:alarm_app/views/stopwatch_page.dart';
// import 'package:alarm_app/views/timer_page.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 0;

//   final List<Widget> _pages = [
//     const ClockPage(),
//     AlarmPage(),
//     TimerScreen(),
//     StopwatchScreen(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.black,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             backgroundColor: Colors.black,
//             icon: Icon(
//               Icons.watch_later_outlined,
//               size: 30,
//             ),
//             label: 'Clock',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.alarm,
//               size: 30,
//             ),
//             label: 'Alarm',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.stop_circle_outlined,
//               size: 30,
//             ),
//             label: 'Stopwatch',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.timer_outlined,
//               size: 30,
//             ),
//             label: 'Timer',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         onTap: _onItemTapped,
//         type: BottomNavigationBarType.fixed, // Can use fixed or shifting
//       ),
//     );
//   }
// }

import 'package:alarm_app/views/alarm_page.dart';
import 'package:alarm_app/views/clock_page.dart';
import 'package:alarm_app/views/stopwatch_page.dart';
import 'package:alarm_app/views/timer_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();
  bool isDarkMode = false;

  @override
  void initState() {
    _loadDarkModePreference();
    super.initState();
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
  }

  Future<void> _loadDarkModePreference() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode =
          prefs.getBool('isDarkMode') ?? false; // Default to false if not set
    });
  }

  void _toggleDarkMode() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      isDarkMode = !isDarkMode;
    });

    await prefs.setBool('isDarkMode', isDarkMode); // Save the state
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('تم تفعيل الوضع الليلي'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'toggle_dark_mode') {
                _toggleDarkMode();
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem<String>(
                value: 'toggle_dark_mode',
                child: Text('تفعيل الليلي'),
              ),
            ],
            icon: Icon(
              Icons.more_vert,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          ClockPage(
            isDarkMode: isDarkMode,
          ),
          AlarmPage(),
          TimerScreen(
            isDarkMode: isDarkMode,
          ),
          StopwatchScreen(
            isDarkMode: isDarkMode,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.watch_later_outlined,
              size: 30,
            ),
            label: 'Clock',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.alarm,
              size: 30,
            ),
            label: 'Alarm',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.stop_circle_outlined,
              size: 30,
            ),
            label: 'Stopwatch',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.timer_outlined,
              size: 30,
            ),
            label: 'Timer',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
