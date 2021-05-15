import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/text_styles.dart';
import '../../../extensions/duration.dart';
import '../../../providers/workout_provider.dart';
import '../../../services/size_service.dart';

class AddWorkoutModalHeader extends StatelessWidget {
  const AddWorkoutModalHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutProvider>(
        builder: (context, workoutProvider, child) {
      return Row(
        children: [
          Text(
              '${workoutProvider.currentWorkout.excercises.length.toString()} exercises',
              style: AppTextStyles.regularCopy),
          SizedBox(
            width: scaleWidth(2.5),
          ),
          Text('|', style: AppTextStyles.regularCopy),
          SizedBox(
            width: scaleWidth(2.5),
          ),
          Text(
              'Total Duration: ${Duration(seconds: workoutProvider.currentWorkout.durationInS).format()}',
              style: AppTextStyles.regularCopy),
          Spacer(),
        ],
      );
    });
  }
}
