import 'package:freezed_annotation/freezed_annotation.dart';
part 'subject_model.g.dart';

@JsonSerializable()
class SubjectModel {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "name")
  final String name;

  SubjectModel({
    required this.id,
    required this.name,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectModelToJson(this);
}
