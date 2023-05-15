import 'package:json_annotation/json_annotation.dart';

part 'board_model.g.dart';

@JsonSerializable()
class BoardModel {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "board_id")
  final String boardId;
  @JsonKey(name: "image")
  final String image;
  @JsonKey(name: "state")
  final String state;

  BoardModel(
    this.boardId,
    this.image,
    this.state, {
    required this.id,
    required this.name,
  });

  factory BoardModel.fromJson(Map<String, dynamic> json) =>
      _$BoardModelFromJson(json);

  Map<String, dynamic> toJson() => _$BoardModelToJson(this);
}
