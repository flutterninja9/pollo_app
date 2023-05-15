// use json_serializable to generate the StateModel with id and name field

import 'package:json_annotation/json_annotation.dart';

part 'state_model.g.dart';

@JsonSerializable()
class StateModel {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "state")
  final String state;
  @JsonKey(name: "state_id")
  final String stateId;
  @JsonKey(name: "image")
  final String image;

  StateModel({
    required this.id,
    required this.state,
    required this.stateId,
    required this.image,
  });
  factory StateModel.fromJson(Map<String, dynamic> json) =>
      _$StateModelFromJson(json);

  Map<String, dynamic> toJson() => _$StateModelToJson(this);
}
