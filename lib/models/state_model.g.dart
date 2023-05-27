// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StateModel _$StateModelFromJson(Map<String, dynamic> json) => StateModel(
      id: json['id'] as String,
      state: json['state'] as String,
      stateId: json['state_id'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$StateModelToJson(StateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'state': instance.state,
      'state_id': instance.stateId,
      'image': instance.image,
    };
