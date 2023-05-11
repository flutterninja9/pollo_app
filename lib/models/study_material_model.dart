import 'package:json_annotation/json_annotation.dart';
import 'package:pollo_education/models/board_model.dart';
import 'package:pollo_education/models/state_model.dart';
import 'package:pollo_education/models/subject_model.dart';
part 'study_material_model.g.dart';

@JsonSerializable()
class StudyMaterialModel {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "subject")
  final SubjectModel subject;
  @JsonKey(name: "board")
  final BoardModel board;
  @JsonKey(name: "class")
  final String classId;
  @JsonKey(name: "state")
  final StateModel state;
  @JsonKey(name: "created_at")
  final String createdAt;
  @JsonKey(name: "updated_at")
  final String updatedAt;

  StudyMaterialModel({
    required this.id,
    required this.name,
    required this.description,
    required this.subject,
    required this.board,
    required this.classId,
    required this.state,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StudyMaterialModel.fromJson(Map<String, dynamic> json) =>
      _$StudyMaterialModelFromJson(json);

  Map<String, dynamic> toJson() => _$StudyMaterialModelToJson(this);
}
