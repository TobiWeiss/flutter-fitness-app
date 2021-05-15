import 'package:json_annotation/json_annotation.dart';

import 'excercise_interface.dart';

part 'workout_interface.g.dart';

@JsonSerializable(nullable: true)
class Workout {
  String name;
  int breakDurationInS;
  int repetitions;
  int durationInS;
  List<Excercise> excercises;


  Workout(
      {this.name = '',
      this.excercises,
      this.breakDurationInS = 0,
      this.repetitions = 1,
      this.durationInS = 0});

  int getNettoExcerciseDurationInS() {
    int duration = 0;
    excercises.forEach((element) {
      duration += element.durationInS;
    });

    return duration;
  }

  factory Workout.fromJson(Map<String, dynamic> json) =>
      _$WorkoutFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutToJson(this);
}
