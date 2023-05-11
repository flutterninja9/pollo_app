import 'package:freezed_annotation/freezed_annotation.dart';

part 'class_model.g.dart';

@JsonSerializable()
class ClassModel {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "name")
  final String name;

  ClassModel({
    required this.id,
    required this.name,
  });

  factory ClassModel.fromJson(Map<String, dynamic> json) =>
      _$ClassModelFromJson(json);

  Map<String, dynamic> toJson() => _$ClassModelToJson(this);
}
