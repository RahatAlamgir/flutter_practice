import 'package:flutter/material.dart';
import 'package:flutter_practice/probider/model/clock_model.dart';
import 'package:provider/provider.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({super.key});

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Clock")),
      body: Center(
        child: Consumer<ClockModel>(
          builder: (context, clock, _) {
            return Text(clock.clock.toString());
          },
        ),
      ),
    );
  }
}
