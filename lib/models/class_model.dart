import 'package:freezed_annotation/freezed_annotation.dart';

part 'class_model.g.dart';

@JsonSerializable()
class ClassModel {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "class_name")
  final String classNAme;
  @JsonKey(name: "state")
  final String stateName;
  @JsonKey(name: "board")
  final String board;
  @JsonKey(name: "course_id")
  final String courseId;
  @JsonKey(name: "total_subject")
  final String totalSubject;
  @JsonKey(name: "subject")
  final String subject;
  @JsonKey(name: "chapter")
  final String chapter;

  ClassModel({
    required this.id,
    required this.classNAme,
    required this.stateName,
    required this.board,
    required this.courseId,
    required this.totalSubject,
    required this.subject,
    required this.chapter,
  });

  factory ClassModel.fromJson(Map<String, dynamic> json) =>
      _$ClassModelFromJson(json);

  Map<String, dynamic> toJson() => _$ClassModelToJson(this);
}
