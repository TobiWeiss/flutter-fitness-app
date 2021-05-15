import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/workout_provider.dart';
import '../excercise/excercise_card.dart';

class AddWorkoutModalListView extends StatelessWidget {
  final double height;

  const AddWorkoutModalListView({
    @required this.height,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ReorderableListView(
          scrollDirection: Axis.vertical,
          children: List.generate(
            Provider.of<WorkoutProvider>(context)
                .currentWorkout
                .excercises
                .length,
            (index) => ExcerciseCard(
              Provider.of<WorkoutProvider>(context).currentWorkout.excercises,
              index,
              Key('$index'),
            ),
          ),
          onReorder: Provider.of<WorkoutProvider>(context).reorderExcercises),
    );
  }
}
