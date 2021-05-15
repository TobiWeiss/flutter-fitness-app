import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../interfaces/serialization/excercise_interface.dart';
import '../../../providers/workout_provider.dart';
import '../../../services/size_service.dart';
import '../../base/hoverable_button.dart';
import '../../base/hoverable_text_input.dart';

class AddWorkoutModalInput extends StatefulWidget {
  const AddWorkoutModalInput({
    Key key,
  }) : super(key: key);

  @override
  _AddWorkoutModalInputState createState() => _AddWorkoutModalInputState();
}

class _AddWorkoutModalInputState extends State<AddWorkoutModalInput> {
  String excerciseName;
  int duration;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HoverableTextInput(
          width: scaleWidth(160),
          labelText: 'excerise name',
          suffixText: null,
          iconData: Icons.edit_rounded,
          defaultColor: Colors.white,
          hoverColor: AppColors.red,
          onChanged: (String onChanged) {
            setState(() => excerciseName = onChanged);
          },
        ),
        SizedBox(
          width: scaleWidth(10),
        ),
        HoverableTextInput(
          width: scaleWidth(60),
          labelText: 'duration',
          suffixText: 's',
          iconData: Icons.watch_later_outlined,
          defaultColor: Colors.white,
          hoverColor: AppColors.red,
          onChanged: (String onChanged) => setState(
            () => duration = int.parse(onChanged),
          ),
        ),
        Spacer(),
        HoverableButton(
          text: null,
          iconData: FontAwesomeIcons.plusSquare,
          defaultColor: Colors.white,
          hoverColor: AppColors.red,
          size: 45,
          onPressed: addExcercise,
        ),
      ],
    );
  }

  void addExcercise() {
    Excercise excercise = Excercise(name: excerciseName, durationInS: duration);
    Provider.of<WorkoutProvider>(context, listen: false)
        .addExcercise(excercise);
  }
}
