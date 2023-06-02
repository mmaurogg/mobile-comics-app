import 'dart:async';
import 'package:flutter/material.dart';

import '../../src/widgets/alert_notificaction.dart';

class TimerService extends ChangeNotifier {
  Timer? _timer;
  var count = 0;

  Duration get currentDuration => _currenDuration;
  Duration _currenDuration = Duration.zero;

  bool get isRunning => _timer != null;

  void _logOut(Timer timer) {
    //stop();
    //AlertNotification(context, 'ya pasaron', '5 seg');
    notifyListeners();

    count++;
    reset();
  }

  void start() {
    if (_timer != null) return;
    _timer = Timer.periodic(const Duration(seconds: 3), _logOut);
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  void reset() {
    stop();
    start();
  }

/*   static TimerService of(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    //context.dependOnInheritedWidgetOfExactType<TimerServiceProvider>();
    //return provider!.service;
    return provider;
  } */

}
