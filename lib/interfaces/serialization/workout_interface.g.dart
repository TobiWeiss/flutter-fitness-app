// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_interface.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Workout _$WorkoutFromJson(Map<String, dynamic> json) {
  return Workout(
    name: json['name'] as String,
    excercises: (json['excercises'] as List)
        ?.map((e) =>
            e == null ? null : Excercise.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$WorkoutToJson(Workout instance) => <String, dynamic>{
      'name': instance.name,
      'excercises': instance.excercises,
    };
