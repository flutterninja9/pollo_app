import 'package:json_annotation/json_annotation.dart';

part 'board_model.g.dart';

@JsonSerializable()
class BoardModel {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "name")
  final String name;

  BoardModel({
    required this.id,
    required this.name,
  });

  factory BoardModel.fromJson(Map<String, dynamic> json) =>
      _$BoardModelFromJson(json);

  Map<String, dynamic> toJson() => _$BoardModelToJson(this);
}
