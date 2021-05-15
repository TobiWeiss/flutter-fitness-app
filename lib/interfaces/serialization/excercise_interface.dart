import 'package:json_annotation/json_annotation.dart';

part 'excercise_interface.g.dart';

@JsonSerializable(nullable: true)
class Excercise {
  final String name;
  final int durationInS;

  Excercise({this.name, this.durationInS});

  factory Excercise.fromJson(Map<String, dynamic> json) => _$ExcerciseFromJson(json);
  Map<String, dynamic> toJson() => _$ExcerciseToJson(this);
}
