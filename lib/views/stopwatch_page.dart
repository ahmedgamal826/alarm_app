import 'dart:async';

import 'package:flutter/material.dart';

class StopwatchScreen extends StatefulWidget {
  StopwatchScreen({required this.isDarkMode});
  late bool isDarkMode;

  @override
  _StopwatchScreenState createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  late Stopwatch _stopwatch;
  Timer? _timer;

  String _formattedTime = "00:00:00";

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
  }

  // @override
  // void dispose() {
  //   _timer!.cancel();
  //   super.dispose();
  // }

  void _startStopwatch() {
    if (!_stopwatch.isRunning) {
      _stopwatch.start();
      _timer = Timer.periodic(Duration(seconds: 1), _updateTime);
    } else {
      _stopwatch.stop();
      _timer!.cancel();
    }
  }

  void _resetStopwatch() {
    _stopwatch.reset();
    _updateTime(null);
  }

  void _updateTime(Timer? timer) {
    final int seconds = _stopwatch.elapsed.inSeconds;
    final int hours = seconds ~/ 3600;
    final int minutes = (seconds % 3600) ~/ 60;
    final int secs = seconds % 60;

    setState(() {
      _formattedTime =
          "${_twoDigits(hours)}:${_twoDigits(minutes)}:${_twoDigits(secs)}";
    });
  }

  String _twoDigits(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: widget.isDarkMode ? Colors.black : Colors.white,
        title: Text(
          'Stopwatch',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: widget.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _formattedTime,
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: widget.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        widget.isDarkMode ? Colors.white : Colors.black,
                  ),
                  onPressed: _startStopwatch,
                  child: Text(
                    _stopwatch.isRunning ? 'Stop' : 'Start',
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        widget.isDarkMode ? Colors.white : Colors.black,
                  ),
                  onPressed: _resetStopwatch,
                  child: const Text(
                    'Reset',
                    style: TextStyle(
                      fontSize: 22,
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
