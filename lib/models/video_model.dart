
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pollo_education/models/board_model.dart';
import 'package:pollo_education/models/class_model.dart';
import 'package:pollo_education/models/subject_model.dart';
part 'video_model.g.dart';

@JsonSerializable()
class VideoModel {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "url")
  final String url;
  @JsonKey(name: "thumbnail")
  final String thumbnail;
  @JsonKey(name: "board")
  final BoardModel board;
  @JsonKey(name: "subject")
  final SubjectModel subject;
  @JsonKey(name: "class")
  final ClassModel classModel;

  VideoModel({
    required this.id,
    required this.name,
    required this.url,
    required this.thumbnail,
    required this.board,
    required this.subject,
    required this.classModel,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideoModelToJson(this);
}
