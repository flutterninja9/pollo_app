import 'package:json_annotation/json_annotation.dart';

part 'scholarship_class_model.g.dart';

@JsonSerializable()
class ScholarshipClassModel {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "date")
  final String date;
  @JsonKey(name: "level")
  final String level;

  ScholarshipClassModel(
    this.date,
    this.level, {
    required this.id,
    required this.name,
  });

  factory ScholarshipClassModel.fromJson(Map<String, dynamic> json) =>
      _$ScholarshipClassModelFromJson(json);

  Map<String, dynamic> toJson() => _$ScholarshipClassModelToJson(this);
}
