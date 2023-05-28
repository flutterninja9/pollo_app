import 'package:json_annotation/json_annotation.dart';

part 'computer_course_model.g.dart';

@JsonSerializable()
class ComputerCourseModel {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'image')
  final String image;
  @JsonKey(name: 'date')
  final String date;
  @JsonKey(name: 'course_id')
  final String courseId;
  @JsonKey(name: 'description')
  final String description;

  ComputerCourseModel({
    required this.id,
    required this.name,
    required this.image,
    required this.date,
    required this.courseId,
    required this.description,
  });

  factory ComputerCourseModel.fromJson(Map<String, dynamic> json) =>
      _$ComputerCourseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ComputerCourseModelToJson(this);
}
