import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../constants/text_styles.dart';
import '../../../providers/workout_provider.dart';
import '../../../services/size_service.dart';
import '../../base/hoverable_button.dart';
import '../../base/hoverable_text_input.dart';

class AddWorkoutModalFooter extends StatefulWidget {
  const AddWorkoutModalFooter({
    Key key,
  }) : super(key: key);

  @override
  _AddWorkoutModalFooterState createState() => _AddWorkoutModalFooterState();
}

class _AddWorkoutModalFooterState extends State<AddWorkoutModalFooter> {
  int repetitions = 0;
  int pauseDuration;
  String workoutName;

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutProvider>(
        builder: (context, workoutProvider, child) {
      return Row(
        children: [
          HoverableTextInput(
            width: scaleWidth(60),
            labelText: 'break duration',
            suffixText: 's',
            iconData: Icons.watch_later_outlined,
            defaultColor: Colors.white,
            hoverColor: AppColors.red,
            onChanged: (String onChanged) => workoutProvider
                .currentWorkout.breakDurationInS = int.parse(onChanged),
          ),
          SizedBox(
            width: scaleWidth(10),
          ),
          IconButton(
            icon: new Icon(Icons.remove, color: Colors.white),
            onPressed: () => workoutProvider.removeRepetition(),
          ),
          Text('${workoutProvider.currentWorkout.repetitions} repetitions',
              style: AppTextStyles.regularCopy),
          IconButton(
            icon: new Icon(Icons.add, color: Colors.white),
            onPressed: () => workoutProvider.addRepetition(),
          ),
          Spacer(),
          HoverableButton(
            text: null,
            iconData: FontAwesomeIcons.arrowCircleRight,
            defaultColor: Colors.white,
            hoverColor: AppColors.red,
            size: 45,
            onPressed: () => showDialog(
                builder: (context) => Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      child: Container(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.darkBlue,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 0.5,
                                blurRadius: 0.5,
                                offset: Offset(0, 1),
                              )
                            ],
                          ),
                          height: scaleWidth(30),
                          width: scaleWidth(130),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: <Widget>[
                                HoverableTextInput(
                                  width: scaleWidth(100),
                                  labelText: 'workout name',
                                  iconData: Icons.edit,
                                  defaultColor: Colors.white,
                                  hoverColor: AppColors.red,
                                  onChanged: (String onChanged) =>
                                      workoutProvider.currentWorkout.name =
                                          onChanged,
                                ),
                                Spacer(),
                                HoverableButton(
                                    text: null,
                                    iconData: FontAwesomeIcons.arrowCircleRight,
                                    defaultColor: Colors.white,
                                    hoverColor: AppColors.red,
                                    size: 45,
                                    onPressed: () async {
                                      workoutProvider.startWorkout();
                                      await Navigator.of(context)
                                          .pushReplacementNamed('/workout');
                                    }),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                context: context),
          ),
        ],
      );
    });
  }
}
