import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../constants/text_styles.dart';
import '../../../hooks/timer_hook.dart';
import '../../../providers/workout_provider.dart';
import '../../../services/size_service.dart';

class PerformWorkoutScreen extends StatefulWidget {
  @override
  _PerformWorkoutScreenState createState() => _PerformWorkoutScreenState();
}

class _PerformWorkoutScreenState extends State<PerformWorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: ExcerciseTimer(
              duration: Provider.of<WorkoutProvider>(context)
                  .currentExcercise
                  .durationInS,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WorkoutProgress(),
                SizedBox(
                  height: scaleWidth(20),
                ),
                Text(
                    'Next Excercise: \n ${Provider.of<WorkoutProvider>(context).getNextExcerciseName()}',
                    style: AppTextStyles.h1)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ExcerciseTimer extends HookWidget {
  final int duration;

  const ExcerciseTimer({@required this.duration});

  @override
  Widget build(BuildContext context) {
    final number = useTimer(duration);
     bool isDone = Provider.of<WorkoutProvider>(context).isDone;

    return CircularPercentIndicator(
      radius: 700.0,
      lineWidth: 35.0,
      percent: !isDone ? number / duration : 0,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            !isDone ? number.toString() : '0',
            style: AppTextStyles.h2,
          ),
          Text(
            !isDone ? Provider.of<WorkoutProvider>(context).currentExcercise.name : 'Fertig :)',
            style: AppTextStyles.h1,
          ),
        ],
      ),
      circularStrokeCap: CircularStrokeCap.butt,
      backgroundColor: Colors.white,
      progressColor: AppColors.red,
    );
  }
}

class WorkoutProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int excercisesDone = Provider.of<WorkoutProvider>(context).currentExcerciseIndex;
    int amountOfExcercises =
        Provider.of<WorkoutProvider>(context).currentWorkout.excercises.length;
    double percent = excercisesDone / amountOfExcercises;
    bool isDone = Provider.of<WorkoutProvider>(context).isDone;
    return LinearPercentIndicator(
      width: 600.0,
      lineHeight: 80.0,
      percent: !isDone ? percent : 1.0,
      center: Text(
        '${!isDone ? percent * 100 : 100}%',
        style: new TextStyle(fontSize: 12.0),
      ),
      linearStrokeCap: LinearStrokeCap.roundAll,
      backgroundColor: Colors.white,
      progressColor: Colors.deepOrange,
    );
  }
}
