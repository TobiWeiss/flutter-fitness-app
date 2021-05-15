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
    
    return CircularPercentIndicator(
      radius: 500.0,
      lineWidth: 15.0,
      percent: number / duration,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            number.toString(),
            style: AppTextStyles.h2,
          ),
          Text(
            Provider.of<WorkoutProvider>(context).currentExcercise.name,
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
    return LinearPercentIndicator(
      width: 600.0,
      lineHeight: 80.0,
      percent: Provider.of<WorkoutProvider>(context)
              .currentWorkout
              .excercises
              .indexOf(Provider.of<WorkoutProvider>(context).currentExcercise) /
          Provider.of<WorkoutProvider>(context)
              .currentWorkout
              .excercises
              .length,
      center: Text(
        '${(Provider.of<WorkoutProvider>(context).currentExcerciseIndex / (Provider.of<WorkoutProvider>(context).currentWorkout.excercises.length - 1)) * 100}%',
        style: new TextStyle(fontSize: 12.0),
      ),
      linearStrokeCap: LinearStrokeCap.roundAll,
      backgroundColor: Colors.white,
      progressColor: Colors.deepOrange,
    );
  }
}