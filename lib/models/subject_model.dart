import 'package:freezed_annotation/freezed_annotation.dart';
part 'subject_model.g.dart';

@JsonSerializable()
class SubjectModel {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "subject_name")
  final String name;
  @JsonKey(name: "total_chapter")
  final String totalChapters;
  @JsonKey(name: "course_id")
  final String courseId;

  SubjectModel({
    required this.id,
    required this.name,
    required this.courseId,
    required this.totalChapters,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectModelToJson(this);
}
