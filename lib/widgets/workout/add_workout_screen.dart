import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../services/size_service.dart';
import 'add_workout/add_workout_modal_footer.dart';
import 'add_workout/add_workout_modal_header.dart';
import 'add_workout/add_workout_modal_input.dart';
import 'add_workout/add_workout_modal_list_view.dart';
import 'package:audioplayers/audioplayers.dart';

class AddWorkoutScreen extends StatelessWidget {
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            // TextButton(
            //   style: ButtonStyle(
            //     foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            //   ),
            //   onPressed: () { audioPlayer.play('assets/male_countdown.wav');},
            //   child: Text('TextButton'),
            // ),
            AddWorkoutModalHeader(),
            SizedBox(
              height: scaleWidth(5),
            ),
            AddWorkoutModalInput(),
            SizedBox(
              height: scaleWidth(10),
            ),
            AddWorkoutModalListView(
              height: scaleWidth(100),
            ),
            Spacer(),
            AddWorkoutModalFooter(),
            SizedBox(
              height: scaleWidth(10),
            ),
          ],
        ),
      ),
    );
  }
}
