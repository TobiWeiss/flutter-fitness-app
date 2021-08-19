import 'package:flutter/material.dart';
import '../interfaces/serialization/excercise_interface.dart';
import '../interfaces/serialization/workout_interface.dart';

class WorkoutProvider extends ChangeNotifier {
  Workout currentWorkout;
  Excercise currentExcercise;
  int currentExcerciseIndex;
  bool isDone = false; 

  WorkoutProvider() {
    currentWorkout = Workout();
    currentWorkout.excercises = <Excercise>[];
  }

  void startWorkout() {
    currentExcercise = currentWorkout.excercises[0];
    currentExcerciseIndex = 0;
    if (currentWorkout.repetitions > 1) _addRepetitions();
    if (currentWorkout.breakDurationInS > 0) _addBreakAfterEveryExcercise();
    notifyListeners();
  }

  void nextExcercise() {
    if(currentExcerciseIndex == currentWorkout.excercises.length - 1) {
      isDone = true; 
      notifyListeners();
      return; 
    }
    currentExcercise = currentWorkout.excercises[currentExcerciseIndex + 1];
    currentExcerciseIndex++;
    notifyListeners();
  }

  String getNextExcerciseName() {
    int currentIndex = currentWorkout.excercises.indexOf(currentExcercise);
    if (currentWorkout.excercises.length - 1 == currentIndex)
      return 'Last Excercise';
    return currentWorkout.excercises[currentIndex + 1].name;
  }

  void addRepetition() {
    currentWorkout.repetitions++;
    currentWorkout.durationInS = currentWorkout.getNettoExcerciseDurationInS() *
        currentWorkout.repetitions;
    notifyListeners();
  }

  void removeRepetition() {
    currentWorkout.repetitions--;
    currentWorkout.durationInS = currentWorkout.getNettoExcerciseDurationInS() *
        currentWorkout.repetitions;
    notifyListeners();
  }

  void addExcercise(Excercise excercise) {
    currentWorkout.excercises.add(excercise);
    currentWorkout.durationInS = currentWorkout.getNettoExcerciseDurationInS() *
        currentWorkout.repetitions;
    notifyListeners();
  }

  void removeExcercise(Excercise excercise) {
    currentWorkout.excercises.removeWhere((element) => element == excercise);
    currentWorkout.durationInS = currentWorkout.getNettoExcerciseDurationInS() *
        currentWorkout.repetitions;
    notifyListeners();
  }

  void reorderExcercises(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      // ignore: parameter_assignments
      newIndex -= 1;
    }
    final Excercise excercise = currentWorkout.excercises.removeAt(oldIndex);
    currentWorkout.excercises.insert(newIndex, excercise);
    notifyListeners();
  }

  void submitWorkout(String name) {
    currentWorkout.name = name;
    notifyListeners();
  }

  void _addBreakAfterEveryExcercise() {
    for (int i = 1; i < (currentWorkout.excercises.length - 1) * 2; i = i + 2) {
      if (currentWorkout.excercises.length > i) {
        currentWorkout.excercises.insert(
            i,
            Excercise(
                name: 'Break',
                durationInS: currentWorkout.breakDurationInS ?? 0));
      }
    }
  }

  void _addRepetitions() {
    List<Excercise> excercises = currentWorkout.excercises;
    for (int i = 0; i < currentWorkout.repetitions; i++) {
      currentWorkout.excercises = [...currentWorkout.excercises, ...excercises];
    }
  }
}
