import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'timer_service.dart';

class ActivityDetector extends StatefulWidget {
  final Widget? child;
  final Function(BuildContext) onShouldNavigate;

  const ActivityDetector({
    super.key,
    this.child,
    required this.onShouldNavigate,
  });

  @override
  State<ActivityDetector> createState() => _ActivityDetectorState();
}

class _ActivityDetectorState extends State<ActivityDetector> {
  TimerService? _timerService;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_timerService == null) {
      _timerService = Provider.of<TimerService>(context);
      _timerService!.start();
      _timerService!.addListener(_handleTimerNotifier);
    }
    return GestureDetector(
      onTap: _handleUserInteraction,
      onPanDown: _handleUserInteraction,
      onScaleStart: _handleUserInteraction,
      child: widget.child,
    );
  }

  void _handleUserInteraction([_]) {
    _timerService!.reset();
  }

  void _handleTimerNotifier() {
    print('se acabo el tiempo.');
    widget.onShouldNavigate(context);
  }
}
