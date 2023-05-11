// use json_serializable to generate the StateModel with id and name field

import 'package:json_annotation/json_annotation.dart';

part 'state_model.g.dart';

@JsonSerializable()
class StateModel {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "name")
  final String name;

  StateModel({
    required this.id,
    required this.name,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) =>
      _$StateModelFromJson(json);

  Map<String, dynamic> toJson() => _$StateModelToJson(this);
}
