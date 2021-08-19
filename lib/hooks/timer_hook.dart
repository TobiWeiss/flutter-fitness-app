import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import '../providers/workout_provider.dart';

int useTimer(int durationInS) {
  return use(_Timer());
}

class _Timer extends Hook<int> {
 
  @override
  __InfiniteTimerState createState() => __InfiniteTimerState();
}

class __InfiniteTimerState extends HookState<int, _Timer> {
  Timer _timer;
  int _remainingTime;

  @override
  void initHook() {
    super.initHook();
    bool isDone = Provider.of<WorkoutProvider>(context).isDone;
    _remainingTime = Provider.of<WorkoutProvider>(context, listen: false)
        .currentExcercise
        .durationInS;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime == 0 && !isDone) {
        Provider.of<WorkoutProvider>(context, listen: false).nextExcercise();
        _remainingTime = Provider.of<WorkoutProvider>(context, listen: false)
            .currentExcercise
            .durationInS;
      } else if(!isDone) {
        setState(() {
          _remainingTime = _remainingTime - 1;
        });
      } else {
        print("you're done, great!!");
      }
    });
  }

  @override
  int build(BuildContext context) {
    return _remainingTime;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
