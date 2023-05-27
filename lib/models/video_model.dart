import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_model.g.dart';

@JsonSerializable()
class VideoModel {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "course_id")
  final String courseId;
  @JsonKey(name: "chapter")
  final String chapter;
  @JsonKey(name: "date")
  final String date;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "subject")
  final String? subject;
  @JsonKey(name: "link")
  final String ytLink;

  VideoModel({
    required this.id,
    required this.courseId,
    required this.subject,
    required this.chapter,
    required this.date,
    required this.title,
    required this.description,
    required this.ytLink,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideoModelToJson(this);
}
