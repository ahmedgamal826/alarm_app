import 'dart:async';
import 'dart:math';

import 'package:alarm_app/widgets/clock_painter.dart';
import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  ClockView({Key? key, required this.size, required this.isDarkMode});
  final double size;
  late bool isDarkMode;

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPainter(isDarkMode: widget.isDarkMode),
        ),
      ),
    );
  }
}
