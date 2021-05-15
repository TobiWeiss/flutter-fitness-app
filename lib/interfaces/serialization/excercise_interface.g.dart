// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'excercise_interface.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Excercise _$ExcerciseFromJson(Map<String, dynamic> json) {
  return Excercise(
    name: json['name'] as String,
    durationInS: json['durationInMs'] as int,
  );
}

Map<String, dynamic> _$ExcerciseToJson(Excercise instance) => <String, dynamic>{
      'name': instance.name,
      'durationInMs': instance.durationInS,
    };
