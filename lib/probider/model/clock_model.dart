import 'dart:async';

import 'package:flutter/material.dart';

class ClockModel extends ChangeNotifier {
  int _clock = 0;
  Timer? _timer;

  int get clock => _clock;
  ClockModel() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _clock++;
      notifyListeners();
    });
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
